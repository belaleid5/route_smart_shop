import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/routes/routes_names.dart';

class ReviewsHeader extends StatelessWidget {
  const ReviewsHeader({super.key, 
    required this.totalReviews,
    required this.productId,
    required this.colors,
  });

  final int totalReviews;
  final String productId;
  final MyColors colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Reviews ($totalReviews)',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: colors.textPrimary,
          ),
        ),

        GestureDetector(
          onTap: () => Navigator.of(
            context,
          ).pushNamed(AppRoutesNames.reviews, arguments: productId),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Review All',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: colors.primary,
                ),
              ),
              const SizedBox(width: 2),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
                color: colors.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }}