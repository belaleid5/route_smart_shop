import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/custom_shimmer.dart';

class FlashDealCardShimmer extends StatelessWidget {
  const FlashDealCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: const ShimmerWidget.rectangular(width: double.infinity, height: 16,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerWidget.text(width: 100, height: 14),
                ShimmerWidget.text(width: 70, height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}