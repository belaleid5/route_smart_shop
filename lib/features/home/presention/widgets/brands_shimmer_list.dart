import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/smooth_list_view.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/custom_shimmer.dart';

class BrandsShimmerList extends StatelessWidget {
  const BrandsShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SmoothListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      itemCount: 6,
      itemBuilder: (context, index) {
        return ShimmerBrandItem(
          width: 95,
          height: 72,
          nameWidth: 68,
          showName: true,
          radius: 12,
        ).animateBottomToTop(
          duration: Duration(milliseconds: 300 + (index * 40)),
        );
      },
      duration: const Duration(milliseconds: 300),
    );
  }
}