import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/core/routes/routes_names.dart';

class SectionForgetPassword extends StatelessWidget {
  const SectionForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          context.pushReplacementNamed(AppRoutesNames.forgotPassword);
        },
        child: Text(
          context.translate(LangKeys.forgotPassword),
          style: context.bodyLarge.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: context.colors.primary,
          ),
        ),
      ),
    );
  }
}