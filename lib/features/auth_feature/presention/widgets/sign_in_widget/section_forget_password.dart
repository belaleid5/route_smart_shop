import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/routes/routes_names.dart';

class SectionForgetPassword extends StatelessWidget {
  const SectionForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushReplacementNamed(AppRoutesNames.forgotPassword);
      },
      child: Text(
        'Forgot Password?',
        style: context.textStyle.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: context.color.primary,
        ),
      ),
    );
  }
}
