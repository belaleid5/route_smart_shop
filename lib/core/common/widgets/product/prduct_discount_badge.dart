import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';

class ProductDiscountBadge extends StatelessWidget {
  const ProductDiscountBadge({super.key, required this.percent});

  final String percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: context.colors.primary,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: context.colors.primary.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        '-$percent',
        style: context.textStyle.copyWith(
          fontSize: 10,
          fontWeight: FontWeightHelper.bold,
          color: Colors.white,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}