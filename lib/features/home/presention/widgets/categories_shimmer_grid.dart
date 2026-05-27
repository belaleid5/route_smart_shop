import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/custom_shimmer.dart';

class CategoriesShimmerGrid extends StatelessWidget {
  const CategoriesShimmerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.85,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: 9,
      itemBuilder: (context, index) => ShimmerBrandItem(
        width: 85,
        height: 78,
        nameWidth: 65,
        showName: true,
        radius: 12,
      ).animateBottomToTop(
        duration: Duration(milliseconds: 300 + index * 50),
      ),
    );
  }
}