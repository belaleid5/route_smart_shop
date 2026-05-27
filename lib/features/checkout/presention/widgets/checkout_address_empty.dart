import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart'; // ✅

class CheckoutAddressEmpty extends StatelessWidget {
  const CheckoutAddressEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.colors.shades,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.colors.stroke),
      ),
      child: Text(
        context.translate(LangKeys.noAddressFound),
        style: context.textStyle.copyWith(
          color: context.colors.textSecondary,
        ),
      ),
    );
  }
}
