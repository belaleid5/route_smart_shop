import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/smooth_list_view.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/custom_shimmer.dart';
import 'package:route_smart/core/helper/spacing.dart';

class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SmoothListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 5,
      separatorBuilder: (_, __) => horizontalSpace(16),
      itemBuilder: (_, index) => ShimmerBrandItem(
        width: 78,
        height: 78,
        nameWidth: 70,
        showName: true,
        radius: 12,
      ).animateBottomToTop(
        duration: Duration(milliseconds: 300 + index * 60),
      ),
      duration: const Duration(milliseconds: 300),
    );
  }
}