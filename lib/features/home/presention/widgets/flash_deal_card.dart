import 'package:flutter/material.dart';
import 'package:route_smart/core/common/domain/entites/product_entity.dart';
import 'package:route_smart/core/common/widgets/product/product_card_item.dart';

class FlashDealCard extends StatelessWidget {
  const FlashDealCard({
    super.key,
    required this.product,
    this.onTap,
    this.onFavoriteTap,
    this.onAddToCart,
  });

  final ProductEntity product;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onAddToCart;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ProductCardItem(
        product: product,
        onTap: onTap,
        onFavoriteTap: onFavoriteTap,
        onAddToCart: onAddToCart,
      ),
    );
  }
}
