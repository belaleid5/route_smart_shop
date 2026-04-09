import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/grid_view.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/custom_shimmer.dart';

class GirdViewProductsShimmer extends StatelessWidget {
  const GirdViewProductsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginatedGridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      itemCount: 4,
      hasMore: false,
      itemBuilder: (context, index) {
        return const ShimmerGridItem(imageHeight: 120).animateBottomToTop(
          duration: Duration(milliseconds: 300 + (index * 50)),
        );
      },
    );
  }
}