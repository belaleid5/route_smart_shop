import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';

class ProductPriceLabel extends StatelessWidget {
  const ProductPriceLabel({
    super.key,
    required this.price,
    this.originalPrice,
  });

  final num? price;
  final num? originalPrice;

  @override
  Widget build(BuildContext context) {
    final hasDiscount = originalPrice != null && price != originalPrice;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.monetization_on_outlined, size: 14, color: context.colors.primary),
        const SizedBox(width: 4),
        if (hasDiscount) ...[
          Text(
            originalPrice!.toStringAsFixed(0),
            style: context.textStyle.copyWith(
              fontSize: 10,
              fontWeight: FontWeightHelper.regular,
              color: context.colors.textSecondary,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          const SizedBox(width: 4),
        ],
        Text(
          price?.toStringAsFixed(0) ?? '0',
          style: context.textStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeightHelper.bold,
            color: context.colors.primary,
          ),
        ),
        const SizedBox(width: 2),
        Text(
          'EGP',
          style: context.textStyle.copyWith(
            fontSize: 9,
            fontWeight: FontWeightHelper.medium,
            color: context.colors.primary.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}