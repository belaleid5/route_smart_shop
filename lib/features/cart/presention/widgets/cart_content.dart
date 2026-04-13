import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/cart/data/models/cart_response_model.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/cart/presention/manger/cart_event.dart';
import 'package:route_smart/features/cart/presention/widgets/cart_bottom_bar.dart';
import 'package:route_smart/features/cart/presention/widgets/cart_header.dart';
import 'package:route_smart/features/cart/presention/widgets/cart_item_card.dart';

class CartContent extends StatelessWidget {
  const CartContent({super.key, required this.cart});

  final CartResponseModel cart;

  @override
  Widget build(BuildContext context) {
    final products = cart.data?.products ?? [];
    final totalPrice = cart.data?.totalPrice ?? 0;
    final itemCount = cart.itemCount;

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

              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              if (products.isEmpty)
                SliverFillRemaining(child: _EmptyProductsView())
              else
                SliverList.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final item = products[index];
                    return CartItemCardAnimated(
                      key: ValueKey(item.cartItemId),
                      item: item,
                      index: index,
                      onDelete: () => context.read<CartBloc>().add(
                        CartEvent.removeItem(item.productId),
                      ),
                      onIncrement: () => context.read<CartBloc>().add(
                        CartEvent.updateQuantity(
                          item.productId,
                          item.quantity + 1,
                        ),
                      ),
                      onDecrement: () => context.read<CartBloc>().add(
                        item.quantity > 1
                            ? CartEvent.updateQuantity(
                                item.productId,
                                item.quantity - 1,
                              )
                            : CartEvent.removeItem(item.productId),
                      ),
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

class _EmptyProductsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.translate('no_items_in_cart'),
        style: context.textStyle.copyWith(
          color: context.color.textPrimary,
          fontSize: 16,
        ),
      ),
    );
  }
}
