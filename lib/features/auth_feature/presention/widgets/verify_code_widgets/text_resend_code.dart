import 'package:flutter/material.dart';

class TextResendCode extends StatelessWidget {
  const TextResendCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Didn't receive the code? ",
          style: TextStyle(color: Colors.grey),
        ),
        GestureDetector(
          onTap: () {},
          child: const Text(
            "Resend Code",
            style: TextStyle(
              color: Color(0xFF4C53FF),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
