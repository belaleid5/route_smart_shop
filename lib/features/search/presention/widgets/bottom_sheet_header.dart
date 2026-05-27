import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({super.key, required this.onReset});

  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          context.translate(LangKeys.filters),
          style: context.titleMedium,
        ),
        const Spacer(),
        TextButton(
          onPressed: onReset,
          child: Text(
            context.translate(LangKeys.reset),
            style: context.textStyle.copyWith(
              fontSize: 13,
              fontWeight: FontWeightHelper.medium,
              color: context.colors.primary,
            ),
          ),
        ),
      ],
    );
  }
}