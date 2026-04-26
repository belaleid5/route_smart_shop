import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/custom_shimmer.dart';
import 'package:route_smart/core/helper/spacing.dart';

class SearchLoadingView extends StatelessWidget {
  const SearchLoadingView({super.key});

  static const int _shimmerCount = 8;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: _shimmerCount,
      separatorBuilder: (_, __) => verticalSpace(12),
      itemBuilder: (_, index) => _SearchItemShimmer(index: index),
    );
  }
}

class _SearchItemShimmer extends StatelessWidget {
  const _SearchItemShimmer({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
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
    )
    .animateRightLeft(
      duration: Duration(milliseconds: 300 + (index * 50)),
      isFromStart: false,
    );
  }
}