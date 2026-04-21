import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class SuccessContent extends StatelessWidget {
  const SuccessContent({super.key, required this.colors});

  final MyColors colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: colors.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check_circle, color: colors.primary, size: 60),
        ),
        const SizedBox(height: 32),
        Text(
          'Payment Successful!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: colors.textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Thank You 🎉',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: colors.textPrimary,
          ),
        ),
      ],
    );
  }
}
