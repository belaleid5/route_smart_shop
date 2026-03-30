import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class TextResendCode extends StatelessWidget {
  const TextResendCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Didn't receive the code? ",
          style: context.textStyle.copyWith(
            fontSize: 14,
            color: context.color.textSecondary,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            "Resend Code",
            style: context.textStyle.copyWith(
              fontSize: 14,
              color: Color(0xFF4C53FF),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
