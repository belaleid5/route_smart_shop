import 'package:flutter/material.dart';
import 'package:route_smart/core/common/data/model/brand_response_model.dart';
import 'package:route_smart/core/common/widgets/smooth_list_view.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/features/home/presention/widgets/brand_chip.dart';
import 'package:route_smart/features/home/presention/widgets/brand_loading_chip.dart';

class BrandsList extends StatelessWidget {
  final List<BrandData> brands;
  final bool hasReachedMax;

  const BrandsList({
    super.key,
    required this.brands,
    required this.hasReachedMax,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: SmoothListView.builder(
        duration: Duration(milliseconds: 500),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,

        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: brands.length + (hasReachedMax ? 0 : 1),
        itemBuilder: (context, index) {
          if (index >= brands.length) {
            return const BrandLoadingChip();
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: BrandChip(brand: brands[index]).animateBottomToTop(),
          );
        },
      ),
    );
  }
}
