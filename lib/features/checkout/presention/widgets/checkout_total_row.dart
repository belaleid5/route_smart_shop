// lib/features/checkout/presention/widgets/checkout_total_row.dart

import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/language/lang_keys.dart';

class CheckoutTotalRow extends StatelessWidget {
  const CheckoutTotalRow({super.key, this.totalAmount = 0});

  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.translate(LangKeys.totalAmount),
          style: context.textStyle.copyWith(
            fontSize: 16,
            color: context.colors.textSecondary,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.translate(LangKeys.currencySymbol),
              style: context.textStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: context.colors.textPrimary,
              ),
            ),
            Text(
              totalAmount.toStringAsFixed(2),
              style: context.textStyle.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: context.colors.textPrimary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}