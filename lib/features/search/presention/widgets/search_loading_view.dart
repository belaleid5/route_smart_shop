import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/smooth_list_view.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/search/presention/widgets/search_item_shimmer.dart';

class SearchLoadingView extends StatelessWidget {
  const SearchLoadingView({super.key});

  static const int _shimmerCount = 8;
  static const _animationDuration = Duration(milliseconds: 300); 


  @override
  Widget build(BuildContext context) {
    return SmoothListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: _shimmerCount,
      duration: _animationDuration,
      separatorBuilder: (_, __) => verticalSpace(12),
      itemBuilder: (_, index) => SearchItemShimmer(index: index),
    );
  }
}