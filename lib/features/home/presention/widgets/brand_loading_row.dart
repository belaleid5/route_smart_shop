import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/smooth_list_view.dart';
import 'package:route_smart/core/extensions/custom_shimmer.dart';
import 'package:route_smart/core/helper/spacing.dart';

class BrandsLoadingRow extends StatelessWidget {
  const BrandsLoadingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: SmoothListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 6,
        separatorBuilder: (_, __) => horizontalSpace(12),
        itemBuilder: (context, index) {
          return const ShimmerBrandItem(
            width: 46,
            height: 46,
            nameWidth: 55,
            showName: false,          
            radius: 10,
          );
        },
        duration: const Duration(milliseconds: 200),
      ),
    );
  }
}