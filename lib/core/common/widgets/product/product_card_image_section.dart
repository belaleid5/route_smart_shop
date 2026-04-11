import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/product/prduct_discount_badge.dart';
import 'package:route_smart/core/common/widgets/product/product_image.dart';
import 'package:route_smart/core/common/widgets/product/product_wishlist_button.dart';

class ProductCardImageSection extends StatelessWidget {
  const ProductCardImageSection({
    super.key,
    required this.imageUrl,
    this.discountPercent,
    this.onFavoriteTap,
    this.productId, 
  });

  final String imageUrl;
  final String? discountPercent;
  final VoidCallback? onFavoriteTap;
  final String? productId; 

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProductImage(imageUrl: imageUrl),
        if (discountPercent != null)
          Positioned(
            top: 8,
            left: 8,
            child: ProductDiscountBadge(percent: discountPercent!),
          ),
        Positioned(
          top: 8,
          right: 8,
          child: ProductWishlistButton(
            productId: productId, 
            onTap: onFavoriteTap,
          ),
        ),
      ],
    );
  }
}