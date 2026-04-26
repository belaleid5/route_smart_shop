import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/custom_shimmer.dart';

class ReviewsLoadingShimmer extends StatelessWidget {
  const ReviewsLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: List.generate(
          6, 
          (index) => const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: ShimmerListTile(
              avatarSize: 64,
              showSubtitle: true,
            ),
          ),
        ),
      ),
    );
  }
}