import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/cart/data/models/cart_item_model.dart';
import 'package:route_smart/features/cart/data/models/cart_response_model.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/cart/presention/manger/cart_event.dart';
import 'package:route_smart/features/cart/presention/widgets/cart_bottom_bar.dart';
import 'package:route_smart/features/cart/presention/widgets/cart_header.dart';
import 'package:route_smart/features/cart/presention/widgets/cart_item_card.dart';
import 'package:route_smart/features/cart/presention/widgets/empty_cart_view.dart';

class CartContent extends StatefulWidget {
  const CartContent({super.key, required this.cart});

  final CartResponseModel cart;

  @override
  State<CartContent> createState() => _CartContentState();
}

class _CartContentState extends State<CartContent> {
  final Set<String> _dismissingIds = {};

  /// حذف عبر زرار الـ Delete — يشغل أنيميشن ثم يحذف
  void _handleDeleteButton(BuildContext context, CartItemModel item) {
    if (_dismissingIds.contains(item.productId)) return;
    setState(() => _dismissingIds.add(item.productId));

    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        context.read<CartBloc>().add(CartEvent.removeItem(item.productId));
        setState(() => _dismissingIds.remove(item.productId));
      }
    });
  }

  /// حذف عبر Swipe — يحذف مباشرة بدون أنيميشن إضافية
  void _handleSwipeDelete(BuildContext context, CartItemModel item) {
    if (_dismissingIds.contains(item.productId)) return;
    context.read<CartBloc>().add(CartEvent.removeItem(item.productId));
  }

  @override
  Widget build(BuildContext context) {
    final products = widget.cart.data?.products ?? [];
    final totalPrice = widget.cart.data?.totalPrice ?? 0;
    final itemCount = widget.cart.itemCount;

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
                const SliverFillRemaining(child: EmptyCartView())
              else
                SliverList.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final item = products[index];
                    final isDismissing =
                        _dismissingIds.contains(item.productId);

                    return _CartSwipeItem(
                      key: ValueKey(item.cartItemId),
                      item: item,
                      index: index,
                      isDismissing: isDismissing,
                      onDeleteButton: () =>
                          _handleDeleteButton(context, item),
                      onSwipeDelete: () =>
                          _handleSwipeDelete(context, item),
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

/// ─── Swipe + Delete Animation Wrapper ───────────────────
class _CartSwipeItem extends StatelessWidget {
  const _CartSwipeItem({
    super.key,
    required this.item,
    required this.index,
    required this.isDismissing,
    required this.onDeleteButton,
    required this.onSwipeDelete,
    required this.onIncrement,
    required this.onDecrement,
  });

  final CartItemModel item;
  final int index;
  final bool isDismissing;
  final VoidCallback onDeleteButton;
  final VoidCallback onSwipeDelete;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    final card = CartItemCard(
      item: item,
      onDelete: onDeleteButton,
      onIncrement: onIncrement,
      onDecrement: onDecrement,
    );

    // ── حالة الحذف من الزرار: أنيميشن طيران + تلاشي ──
    if (isDismissing) {
      return card
          .animate()
          .slideX(
            begin: 0,
            end: -1.5,
            duration: 400.ms,
            curve: Curves.easeInBack,
          )
          .fadeOut(
            duration: 300.ms,
            curve: Curves.easeIn,
          )
          .then()
          .custom(
            duration: 200.ms,
            curve: Curves.easeInOut,
            builder: (context, value, child) => SizeTransition(
              sizeFactor: AlwaysStoppedAnimation(1 - value),
              axisAlignment: -1,
              child: child,
            ),
          );
    }

    // ── الحالة العادية: Swipe to Delete ──
    return Dismissible(
      key: ValueKey(item.cartItemId),
      direction: DismissDirection.endToStart,
      dismissThresholds: const {DismissDirection.endToStart: 0.5},
      movementDuration: const Duration(milliseconds: 500),
      confirmDismiss: (_) async {
        onSwipeDelete();
        return false;
      },
      background: const SizedBox.shrink(),
      secondaryBackground: const _SwipeDeleteBackground(),
      child: card
          .animate()
          .fadeIn(
            duration: 800.ms,
            delay: Duration(milliseconds: index * 80),
            curve: Curves.easeInOutQuart,
          )
          .moveY(
            begin: 30,
            end: 0,
            duration: 800.ms,
            delay: Duration(milliseconds: index * 80),
            curve: Curves.easeInOutQuart,
          ),
    );
  }
}

/// ─── Swipe Background ───────────────────────────────────
class _SwipeDeleteBackground extends StatelessWidget {
  const _SwipeDeleteBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.red.shade300,
            Colors.red.shade600,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withValues(alpha: 0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 28),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.delete_rounded,
            color: Colors.white,
            size: 28,
          ),
          SizedBox(height: 4),
          Text(
            'Delete',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}