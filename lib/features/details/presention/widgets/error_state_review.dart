import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class ErrorStateReview extends StatelessWidget {
  const ErrorStateReview({super.key, required this.colors, required this.onRetry});

  final MyColors colors;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 80,
    child: Center(
      child: TextButton.icon(
        onPressed: onRetry,
        icon: Icon(Icons.refresh, color: colors.primary),
        label: Text('Retry', style: TextStyle(color: colors.primary)),
      ),
    ),
  );
}
