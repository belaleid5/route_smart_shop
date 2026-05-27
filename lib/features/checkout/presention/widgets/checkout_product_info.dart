import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart'; // ✅

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
            color: context.colors.textPrimary,
          ),
        ),
        verticalSpace(4),
        Text(
          '${context.translate(LangKeys.quantity)}: $quantity',
          style: context.textStyle.copyWith(
            fontSize: 12,
            color: context.colors.textSecondary,
          ),
        ),
      ],
    );
  }
}
