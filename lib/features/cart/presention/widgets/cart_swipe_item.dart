import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:route_smart/features/cart/domain/entites/cart_item_entity.dart';
import 'package:route_smart/features/cart/presention/widgets/cart_item_card.dart';
import 'package:route_smart/features/cart/presention/widgets/swipe_delete_background.dart';

class CartSwipeItem extends StatelessWidget {
  const CartSwipeItem({
    super.key,
    required this.item,
    required this.index,
    required this.isDismissing,
    required this.onDeleteButton,
    required this.onSwipeDelete,
    required this.onIncrement,
    required this.onDecrement,
  });

  final CartItemEntity item;
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

    if (isDismissing) {
      return card
          .animate()
          .slideX(
            begin: 0,
            end: -1.5,
            duration: 400.ms,
            curve: Curves.easeInBack,
          )
          .fadeOut(duration: 300.ms, curve: Curves.easeIn)
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

    final delayMs = (index * 80).clamp(0, 600).toInt();

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
      secondaryBackground: const SwipeDeleteBackground(),
      child: card
          .animate()
          .fadeIn(
            duration: 800.ms,
            delay: Duration(milliseconds: delayMs),
            curve: Curves.easeInOutQuart,
          )
          .moveY(
            begin: 30,
            end: 0,
            duration: 800.ms,
            delay: Duration(milliseconds: delayMs),
            curve: Curves.easeInOutQuart,
          ),
    );
  }
}
