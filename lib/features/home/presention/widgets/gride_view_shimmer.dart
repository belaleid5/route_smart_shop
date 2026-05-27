import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/custom_shimmer.dart';
import 'package:route_smart/core/helper/spacing.dart';



class GirdViewProductsShimmer extends StatelessWidget {
  const GirdViewProductsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      physics: const NeverScrollableScrollPhysics(), 
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7, 
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return const _ProductCardShimmerItem();
      },
    );
  }
}

class _ProductCardShimmerItem extends StatelessWidget {
  const _ProductCardShimmerItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.colors.surface,
        boxShadow: [
          BoxShadow(
            color: context.colors.primary.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: ShimmerWidget.rectangular(
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShimmerWidget.text(width: 60, height: 10),
                  verticalSpace(8),
                  
                  ShimmerWidget.text(height: 14),
                  verticalSpace(4),
                  ShimmerWidget.text(width: 100, height: 14),
                  
                  const Spacer(),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerWidget.text(width: 50, height: 16),
                      ShimmerWidget.text(width: 30, height: 16),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}