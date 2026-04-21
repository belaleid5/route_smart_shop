import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, required this.colors});

  final MyColors colors;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Route ',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: colors.primary,
            ),
          ),
          TextSpan(
            text: 'Smart',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: colors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
