
import 'package:flutter/material.dart';
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
      itemBuilder: (_, __) => const SearchItemShimmer(),
    );
  }
}


class SearchItemShimmer extends StatelessWidget {
  const SearchItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerWidget.rounded(
          height: 80,
          width: 80,
          radius: 12,
        ),
        horizontalSpace(12),
        // Text placeholders
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
    );
  }
}