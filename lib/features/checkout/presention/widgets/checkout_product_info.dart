import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';

class CheckoutProductInfo extends StatelessWidget {
  const CheckoutProductInfo({
    super.key,
    required this.name,
    required this.quantity,
  });

  final String name;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: context.textStyle.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: context.color.textPrimary,
          ),
        ),
        verticalSpace(4),
        Text(
          'Qty: $quantity',
          style: context.textStyle.copyWith(
            fontSize: 12,
            color: context.color.textSecondary,
          ),
        ),
      ],
    );
  }
}
