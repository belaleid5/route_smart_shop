import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';

class CategoriesEmptyState extends StatelessWidget {
  const CategoriesEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.category_outlined,
            size: 80,
            color: context.colors.textSecondary.withOpacity(0.5),
          ).animateFlipVertical(),
          const SizedBox(height: 24),
          Text(
            'No categories found',
            style: TextStyle(
              color: context.colors.textSecondary,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ).animateBottomToTop(),
        ],
      ),
    );
  }
}
