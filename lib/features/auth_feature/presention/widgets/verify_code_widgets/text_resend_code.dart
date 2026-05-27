import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:route_smart/core/language/lang_keys.dart';

class TextResendCode extends StatelessWidget {
  const TextResendCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.translate(LangKeys.didntReceiveCode),
          style: context.textStyle.copyWith(
            fontSize: 14,
            color: context.colors.textSecondary,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            context.translate(LangKeys.resendCode),
            style: context.textStyle.copyWith(
              fontSize: 14,
              color: context.colors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}