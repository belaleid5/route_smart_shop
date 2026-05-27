import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:route_smart/features/wishlist/domain/entites/wishlist_entity.dart';
import 'package:route_smart/features/wishlist/presention/widgets/wishlist_card.dart';

class WishlistItemWrapper extends StatelessWidget {
  const WishlistItemWrapper({
    super.key,
    required this.item,
    required this.index,
    required this.isRemoving,
    required this.onRemove,
    required this.onAddToCart,
  });

  final WishlistEntity item;
  final int index;
  final bool isRemoving;
  final VoidCallback onRemove;
  final VoidCallback onAddToCart;

  @override
  Widget build(BuildContext context) {
    final card = WishlistCard(
      item: item,
      onRemove: onRemove,
      onAddToCart: onAddToCart,
    );

    if (isRemoving) {
      return card
          .animate()
          .slideX(
            begin: 0,
            end: -1.2,
            duration: 800.ms,
            curve: Curves.easeInBack,
          )
          .fadeOut(duration: 500.ms, curve: Curves.easeIn)
          .rotate(begin: 0, end: -0.05, duration: 600.ms)
          .then()
          .custom(
            duration: 600.ms,
            curve: Curves.easeInOutQuart,
            builder: (context, value, child) => SizeTransition(
              sizeFactor: AlwaysStoppedAnimation(1 - value),
              axisAlignment: -1,
              child: child,
            ),
          );
    }

    return Dismissible(
      key: ValueKey(item.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onRemove(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.red.shade400,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.delete_outline, color: Colors.white, size: 28),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: card,
      ).animate().fadeIn(duration: 400.ms, delay: (index * 50).ms),
    );
  }
}
