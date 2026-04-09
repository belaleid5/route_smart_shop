import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';

class ProductDiscountBadge extends StatelessWidget {
  const ProductDiscountBadge({super.key, required this.percent});

  final String percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: context.color.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '-$percent',
        style: context.textStyle.copyWith(
          fontSize: 10,
          fontWeight: FontWeightHelper.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
