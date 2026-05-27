import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/wishlist/domain/entites/wishlist_entity.dart';
import 'wishlist_card_image.dart';
import 'wishlist_card_details.dart';
import 'wishlist_add_to_cart_button.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({
    super.key,
    required this.item,
    required this.onRemove,
    required this.onAddToCart,
  });

  final WishlistEntity item;
  final VoidCallback onRemove;
  final VoidCallback onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.id),
      direction: DismissDirection.endToStart,
      background: const _SwipeBackground(),
      onDismissed: (_) => onRemove(),
      confirmDismiss: (_) async => _showDeleteConfirm(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WishlistCardImage(
            imageUrl: item.imageCover,
            onDelete: onRemove,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: WishlistCardDetails(
              title: item.title,
              price: item.hasDiscount
                  ? item.priceAfterDiscount!
                  : item.price,
              oldPrice: item.hasDiscount ? item.price : null,
            ),
          ),
          WishlistAddToCartButton(
            onTap: onAddToCart,
            productId: item.id,
          ),
        ],
      ),
    );
  }

  Future<bool?> _showDeleteConfirm(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        // ✅ localized strings
        title: Text(context.translate(LangKeys.itemRemoved)),
        content: Text(
          '"${item.title}" ${context.translate(LangKeys.itemRemoved)}?',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(context.translate(LangKeys.cancel)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(context.translate(LangKeys.yes)),
          ),
        ],
      ),
    );
  }
}

class _SwipeBackground extends StatelessWidget {
  const _SwipeBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: Colors.red.shade400,
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 24),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.delete_outline_rounded, color: Colors.white, size: 28),
          SizedBox(height: 4),
          Text(
            'Delete',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}