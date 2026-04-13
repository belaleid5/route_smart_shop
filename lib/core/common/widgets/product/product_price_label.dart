// lib/core/common/widgets/product_price_label.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';

class ProductPriceLabel extends StatelessWidget {
  const ProductPriceLabel({super.key, required this.price});

  final num? price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.monetization_on_outlined,
          size: 14,
          color: context.color.primary,
        ),
        const SizedBox(width: 3),
        Text(
          price?.toStringAsFixed(0) ?? '0',
          style: context.textStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeightHelper.bold,
            color: context.color.primary,
          ),
        ),
        const SizedBox(width: 2),
        Text(
          'EGP',
          style: context.textStyle.copyWith(
            fontSize: 9,
            fontWeight: FontWeightHelper.medium,
            color: context.color.primary.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}