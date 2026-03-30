import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_shimmer.dart';

class FlashDealCardShimmer extends StatelessWidget {
  const FlashDealCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, 
      decoration: BoxDecoration(
        color: context.color.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            flex: 4,
            child: ShimmerWidget.rectangular(
              width: double.infinity,
              height: double.infinity,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ShimmerWidget.text(width: 100, height: 14),
                  ShimmerWidget.text(width: 60, height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}