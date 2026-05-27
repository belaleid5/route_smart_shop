import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';

class ApplyButton extends StatelessWidget {
  const ApplyButton({super.key, required this.onApply});

  final VoidCallback onApply;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onApply,
        style: ElevatedButton.styleFrom(
          backgroundColor: context.colors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: Text(
          context.translate(LangKeys.applyFilters),
          style: context.textStyle.copyWith(
            fontSize: 15,
            fontWeight: FontWeightHelper.semiBold,
            color: context.colors.white,
          ),
        ),
      ),
    );
  }
}
