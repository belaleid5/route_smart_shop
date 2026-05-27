import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/product/product_price_label.dart';
import 'package:route_smart/core/common/widgets/product/product_rating_badge.dart';

class ProductPriceAndRating extends StatelessWidget {
  const ProductPriceAndRating({
    super.key,
    required this.price,
    this.originalPrice,
    required this.ratingsAverage,
  });

  final num? price;
  final num? originalPrice;
  final double? ratingsAverage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: ProductPriceLabel(price: price, originalPrice: originalPrice)),
        const SizedBox(width: 4),
        ProductRatingBadge(rating: ratingsAverage),
      ],
    );
  }
}