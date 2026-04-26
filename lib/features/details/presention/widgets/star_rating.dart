import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class StarRating extends StatelessWidget {
  const StarRating({required this.rating, required this.colors});

  final double rating;
  final MyColors colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final isFilled = index < rating.floor();
        final isHalf = !isFilled && index < rating;
        return Icon(
          isHalf
              ? Icons.star_half_rounded
              : isFilled
              ? Icons.star_rounded
              : Icons.star_outline_rounded,
          size: 12,
          color: isFilled || isHalf
              ? Colors.amber
              : colors.textSecondary.withOpacity(0.3),
        );
      }),
    );
  }
}