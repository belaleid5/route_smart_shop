import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class CheckoutAddressEmpty extends StatelessWidget {
  const CheckoutAddressEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.color.shades,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.color.stroke),
      ),
      child: Text(
        'No address found. Please add one.',
        style: context.textStyle.copyWith(
          color: context.color.textSecondary,
        ),
      ),
    );
  }
}
