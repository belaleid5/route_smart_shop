// lib/core/common/widgets/product_card_item.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/common/data/model/product_data_model.dart';
import 'package:route_smart/core/common/widgets/product/product_card_image_section.dart';
import 'package:route_smart/core/common/widgets/product/product_info.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({super.key, required this.product});

  final ProductDataModel product;

  bool get _hasDiscount =>
      product.priceAfterDiscount != null &&
      product.priceAfterDiscount! < (product.price ?? 0);

  String? get _discountPercent {
    if (!_hasDiscount) return null;
    final percent =
        ((product.price! - product.priceAfterDiscount!) / product.price!) * 100;
    return '${percent.toInt()}%';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.color.white,
        boxShadow: [
          BoxShadow(
            color: context.color.primary.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
          BoxShadow(
            color: context.color.black.withValues(alpha: 0.04),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: ProductCardImageSection(
              imageUrl: product.imageCover ?? '',
              discountPercent: _discountPercent,
            ),
          ),
          ProductInfo(product: product),
        ],
      ),
    );
  }
}
