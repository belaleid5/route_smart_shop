import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class EmptyStateReview extends StatelessWidget {
  const EmptyStateReview({super.key, required this.colors});
  final MyColors colors;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 80,
    child: Center(
      child: Text(
        'No reviews yet. Be the first!',
        style: TextStyle(color: colors.textSecondary, fontSize: 14),
      ),
    ),
  );
}