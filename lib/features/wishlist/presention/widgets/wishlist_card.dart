// lib/features/wishlist/presentation/widgets/wishlist_card.dart

import 'package:flutter/material.dart';
import 'package:route_smart/features/wishlist/data/model/wishlist_response_model.dart';

import 'wishlist_add_to_cart_button.dart';
import 'wishlist_card_details.dart';
import 'wishlist_card_image.dart';

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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WishlistCardImage(imageUrl: item.imageCover, onDelete: onRemove),
        const SizedBox(width: 12),
        Expanded(
          child: WishlistCardDetails(
            title: item.title ,
            price: (item.priceDouble).toDouble(),
            oldPrice: item.price.toDouble(),
          ),
        ),
        WishlistAddToCartButton(onTap: onAddToCart),
      ],
    );
  }
}


