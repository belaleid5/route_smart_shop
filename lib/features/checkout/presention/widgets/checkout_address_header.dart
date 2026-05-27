import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';

class CheckoutAddressHeader extends StatelessWidget {
  final VoidCallback? onAddAddress;

  const CheckoutAddressHeader({
    super.key,
    this.onAddAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.translate(LangKeys.address),
          style: context.textStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: context.colors.textPrimary,
          ),
        ),

        GestureDetector(
          onTap: onAddAddress,
          child: Text(
            context.translate(LangKeys.addAddress),
            style: context.textStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: context.colors.primary,
            ),
          ),
        ),
      ],
    );
  }
}