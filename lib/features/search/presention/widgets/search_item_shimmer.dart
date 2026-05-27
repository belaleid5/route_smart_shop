import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/custom_shimmer.dart';
import 'package:route_smart/core/helper/spacing.dart';

class SearchItemShimmer extends StatelessWidget {
  const SearchItemShimmer({super.key, required this.index});

  final int index;
  static const int _baseDelayMs = 300;
  static const int _stepDelayMs = 30;
  static const int _maxStepMs = 200;

  @override
  Widget build(BuildContext context) {
    final delayMs = _baseDelayMs + (index * _stepDelayMs).clamp(0, _maxStepMs);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerWidget.rounded(height: 80, width: 80, radius: 12),
        horizontalSpace(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(4),
              ShimmerWidget.text(width: double.infinity, height: 16),
              verticalSpace(8),
              ShimmerWidget.text(width: 150, height: 14),
              verticalSpace(8),
              ShimmerWidget.text(width: 100, height: 12),
            ],
          ),
        ),
      ],
    ).animateRightLeft(
      duration: Duration(milliseconds: delayMs),
      isFromStart: false,
    );
  }
}
