import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';

class WidgetCustomCheckBoxAgreeTerms extends StatefulWidget {
  const WidgetCustomCheckBoxAgreeTerms({super.key});

  @override
  State<WidgetCustomCheckBoxAgreeTerms> createState() =>
      _WidgetCustomCheckBoxAgreeTermsState();
}

class _WidgetCustomCheckBoxAgreeTermsState
    extends State<WidgetCustomCheckBoxAgreeTerms> {
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _agreeToTerms,
          onChanged: (val) => setState(() => _agreeToTerms = val!),
          activeColor: context.colors.primary,
        ),
        Expanded(
          child: Text(
            context.translate(LangKeys.termsAndPrivacy),
            style: context.textStyle.copyWith(
              color: context.colors.textSecondary,
              fontSize: 12,
            ),
          ),
        ),
      ],
    ).animateBlur();
  }
}
