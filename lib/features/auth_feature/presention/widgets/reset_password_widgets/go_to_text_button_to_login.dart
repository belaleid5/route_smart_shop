import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/core/routes/routes_names.dart';

class GotTextButtonToLogin extends StatelessWidget {
  const GotTextButtonToLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => context.pushNamedAndRemoveUntil(AppRoutesNames.signIn),
      icon: Icon(
        Icons.arrow_back,
        size: 18,
        color: context.colors.primary,
      ),
      label: Text(
        context.translate(LangKeys.backToLogin),
        style: context.bodyLarge.copyWith(
          color: context.colors.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}