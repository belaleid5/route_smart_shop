import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/routes/routes_names.dart';

class GotTextButtonToLogin extends StatelessWidget {
  const GotTextButtonToLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.pushNamedAndRemoveUntil(AppRoutesNames.signIn),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.arrow_back, size: 18, color: context.color.textSecondary),
          horizontalSpace(8),
          Text(
            'Back to Login',
            style: context.textStyle.copyWith(
              color: context.color.textSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
