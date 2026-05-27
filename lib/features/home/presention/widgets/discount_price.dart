import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class DiscountPrice extends StatelessWidget {
  final String? discountPercentage;

  const DiscountPrice({super.key, this.discountPercentage});

  @override
  Widget build(BuildContext context) {
    if (discountPercentage == null || discountPercentage == '0') {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: context.colors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '$discountPercentage% OFF',
        style: context.textTheme.labelSmall?.copyWith(
          color: context.colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}