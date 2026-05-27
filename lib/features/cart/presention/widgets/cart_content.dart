import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/cart/domain/entites/cart_entity.dart';
import 'package:route_smart/features/cart/domain/entites/cart_item_entity.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/cart/presention/manger/cart_event.dart';
import 'package:route_smart/features/cart/presention/widgets/cart_bottom_bar.dart';
import 'package:route_smart/features/cart/presention/widgets/cart_header.dart';
import 'package:route_smart/features/cart/presention/widgets/cart_swipe_item.dart';
import 'package:route_smart/features/cart/presention/widgets/empty_cart_view.dart';

class CartContent extends StatefulWidget {
  const CartContent({super.key, required this.cart});

  final CartEntity cart;

  @override
  State<CartContent> createState() => _CartContentState();
}

class _CartContentState extends State<CartContent> {
  final Set<String> _dismissingIds = <String>{};

  void _handleDeleteButton(BuildContext context, CartItemEntity item) {
    if (_dismissingIds.contains(item.productId)) return;

    final cartBloc = context.read<CartBloc>();

    setState(() => _dismissingIds.add(item.productId));

    Future.delayed(const Duration(milliseconds: 600), () {
      if (!mounted) return;

      cartBloc.add(RemoveFromCartRequested(productId: item.productId));

      setState(() => _dismissingIds.remove(item.productId));
    });
  }

  void _handleSwipeDelete(BuildContext context, CartItemEntity item) {
    if (_dismissingIds.contains(item.productId)) return;

    context.read<CartBloc>().add(
      RemoveFromCartRequested(productId: item.productId),
    );
  }

  @override
  Widget build(BuildContext context) {
    final products = widget.cart.items;
    final totalPrice = widget.cart.totalPrice;
    final itemCount = products.length;

    if (products.isEmpty) {
      return const EmptyCartView();
    }

    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: CartHeader(itemCount: itemCount).animateBottomToTop(
                  duration: const Duration(milliseconds: 400),
                ),
              ),
              SliverToBoxAdapter(child: verticalSpace(16)),
              SliverList.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final item = products[index];
                  final isDismissing = _dismissingIds.contains(item.productId);

                  return CartSwipeItem(
                    key: ValueKey(item.cartItemId),
                    item: item,
                    index: index,
                    isDismissing: isDismissing,
                    onDeleteButton: () => _handleDeleteButton(context, item),
                    onSwipeDelete: () => _handleSwipeDelete(context, item),
                    onIncrement: () {
                      context.read<CartBloc>().add(
                        UpdateQuantityRequested(
                          productId: item.productId,
                          quantity: item.quantity + 1,
                        ),
                      );
                    },
                    onDecrement: () {
                      context.read<CartBloc>().add(
                        item.quantity > 1
                            ? UpdateQuantityRequested(
                                productId: item.productId,
                                quantity: item.quantity - 1,
                              )
                            : RemoveFromCartRequested(
                                productId: item.productId,
                              ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        CartBottomBar(
          totalPrice: totalPrice,
        ).animateBottomToTop(duration: const Duration(milliseconds: 500)),
        verticalSpace(150),
      ],
    );
  }
}
