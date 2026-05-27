import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/domain/entites/product_entity.dart';
import 'package:route_smart/core/common/widgets/product/product_card_image_section.dart';
import 'package:route_smart/core/common/widgets/product/product_info.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({
    super.key,
    required this.product,
    this.onTap,
    this.onFavoriteTap,
    this.onAddToCart,
    this.isAddedToCart = false,
  });

  final ProductEntity product;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onAddToCart;
  final bool isAddedToCart;

  String? get _discountPercent {
    if (!product.hasDiscount) return null;
    final percentage = product.discountPercentage;
    if (percentage <= 0) return null;
    return '$percentage%';
  }

  String get _imageUrl => product.displayImage ?? '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: context.colors.surface,
          boxShadow: [
            BoxShadow(
              color: context.colors.primary.withOpacity(0.06),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
            BoxShadow(
              color: context.colors.black.withOpacity(0.04),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: ProductCardImageSection(
                imageUrl: _imageUrl,
                discountPercent: _discountPercent,
                onFavoriteTap: onFavoriteTap,
                productId: product.id,
                onAddToCart: onAddToCart,
                isAddedToCart: isAddedToCart,
              ),
            ),
            ProductInfo(product: product),
          ],
        ),
      ),
    );
  }
}
