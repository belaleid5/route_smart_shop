import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class LoadingContent extends StatelessWidget {
  const LoadingContent({super.key, required this.colors});

  final MyColors colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: CircularProgressIndicator(
            strokeWidth: 4,
            color: colors.primary,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Processing your payment...',
          style: TextStyle(fontSize: 18, color: colors.textSecondary),
        ),
        const SizedBox(height: 8),
        Text(
          'Please wait',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: colors.textPrimary,
          ),
        ),
      ],
    );
  }
}
