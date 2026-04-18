import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class ProductDetailsRatingRow extends StatelessWidget {
  const ProductDetailsRatingRow({
    super.key,
    required this.rating,
    required this.reviewCount,
  });

  final double rating;
  final int reviewCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star_rounded, color: Colors.amber, size: 20),
        const SizedBox(width: 4),
        Text(
          rating.toStringAsFixed(1),
          style: context.textStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: context.color.textPrimary,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '($reviewCount ${context.translate('review')})',
          style: context.textStyle.copyWith(
            fontSize: 13,
            color: context.color.textPrimary.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
