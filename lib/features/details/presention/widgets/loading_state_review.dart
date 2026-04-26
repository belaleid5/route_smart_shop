import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class LoadingStateReview extends StatelessWidget {
  const LoadingStateReview({super.key, required this.colors});
  final MyColors colors;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 140,
    child: Center(
      child: CircularProgressIndicator(color: colors.primary, strokeWidth: 2),
    ),
  );
}