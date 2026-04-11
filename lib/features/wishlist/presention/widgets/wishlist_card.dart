// lib/features/wishlist/presention/widgets/wishlist_card.dart

import 'package:flutter/material.dart';
import 'package:route_smart/features/wishlist/data/model/wishlist_response_model.dart';
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

  final WishlistItemModel item;
  final VoidCallback onRemove;
  final VoidCallback onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.id),
      direction: DismissDirection.endToStart,  // ← swipe من اليمين لليسار

      // ✅ Background عند الـ swipe
      background: _SwipeBackground(),

      // ✅ عند الـ swipe → امسح
      onDismissed: (_) => onRemove(),

      // ✅ Confirm قبل المسح
      confirmDismiss: (_) async {
        return await _showDeleteConfirm(context);
      },

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
              price: item.price.truncateToDouble(),
              oldPrice: item.priceDouble,
            ),
          ),
          WishlistAddToCartButton(onTap: onAddToCart),
        ],
      ),
    );
  }

  // ─── Confirm Dialog ────────────────────────
  Future<bool?> _showDeleteConfirm(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text('Remove Item'),
        content: Text(
          'Remove "${item.title}" from wishlist?',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Remove'),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  SWIPE BACKGROUND  (SRP)
// ─────────────────────────────────────────────
class _SwipeBackground extends StatelessWidget {
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