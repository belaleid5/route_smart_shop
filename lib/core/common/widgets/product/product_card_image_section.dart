import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/product/prduct_discount_badge.dart';
import 'package:route_smart/core/common/widgets/product/product_image.dart';
import 'package:route_smart/core/common/widgets/product/product_wishlist_button.dart';
import 'package:route_smart/core/common/widgets/product_add_to_cart.dart';

class ProductCardImageSection extends StatelessWidget {
  const ProductCardImageSection({
    super.key,
    required this.imageUrl,
    this.discountPercent,
    this.onFavoriteTap,
    this.productId,
    this.onAddToCart,
  });

  final String imageUrl;
  final String? discountPercent;
  final VoidCallback? onFavoriteTap;
  final String? productId;
  final VoidCallback? onAddToCart;

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
        Positioned(
          bottom: 8,
          right: 8,
          child: ProductAddToCartButton(
            productId: productId, 
            onTap: onAddToCart,
          ),
        ),
      ],
    );
  }
}