import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class CheckoutAddressHeader extends StatelessWidget {
  const CheckoutAddressHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Address',
          style: context.textStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: context.color.textPrimary,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Edit',
            style: context.textStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: context.color.primary,
            ),
          ),
        ),
      ],
    );
  }
}
