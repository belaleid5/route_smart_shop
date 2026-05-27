// lib/core/common/widgets/product_rating_badge.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';

class ProductRatingBadge extends StatelessWidget {
  const ProductRatingBadge({super.key, required this.rating});

  final double? rating;

  @override
  Widget build(BuildContext context) {
    final ratingValue = rating ?? 0.0;
    final ratingColor = _ratingColor(ratingValue);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: ratingColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star_rounded, size: 12, color: ratingColor),
          const SizedBox(width: 2),
          Text(
            ratingValue.toStringAsFixed(1),
            style: context.textStyle.copyWith(
              fontSize: 10,
              fontWeight: FontWeightHelper.semiBold,
              color: ratingColor,
            ),
          ),
        ],
      ),
    );
  }

  Color _ratingColor(double rating) {
    if (rating >= 4.5) return const Color(0xFF22C55E);
    if (rating >= 3.5) return const Color(0xFFF59E0B);
    if (rating >= 2.5) return const Color(0xFFF97316);
    return const Color(0xFFEF4444);
  }
}
