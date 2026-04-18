import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class CheckoutProductPrice extends StatelessWidget {
  const CheckoutProductPrice({super.key, required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '\$ ',
            style: context.textStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: context.color.textSecondary,
            ),
          ),
          TextSpan(
            text: price.toStringAsFixed(2),
            style: context.textStyle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: context.color.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
