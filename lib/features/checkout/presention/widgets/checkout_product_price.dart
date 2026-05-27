import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

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
              color: context.colors.textSecondary,
            ),
          ),
          TextSpan(
            text: price.toStringAsFixed(2),
            style: context.textStyle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: context.colors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
