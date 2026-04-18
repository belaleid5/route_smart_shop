import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class CheckoutTotalRow extends StatelessWidget {
  const CheckoutTotalRow({super.key, this.totalAmount = 0});

  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total amount',
          style: context.textStyle.copyWith(
            fontSize: 16,
            color: context.color.textSecondary,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '\$ ',
              style: context.textStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: context.color.textPrimary,
              ),
            ),
            Text(
              totalAmount.toStringAsFixed(2),
              style: context.textStyle.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: context.color.textPrimary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}