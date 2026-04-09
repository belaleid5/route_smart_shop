// lib/core/common/widgets/product_price_and_rating.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/product/product_price_label.dart';
import 'package:route_smart/core/common/widgets/product/product_rating_badge.dart';

class ProductPriceAndRating extends StatelessWidget {
  const ProductPriceAndRating({
    super.key,
    required this.price,
    required this.ratingsAverage,
  });

  final num? price;
  final double? ratingsAverage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(child: ProductPriceLabel(price: price)),
        ProductRatingBadge(rating: ratingsAverage),
      ],
    );
  }
}