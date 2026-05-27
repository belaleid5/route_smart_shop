import 'package:flutter/material.dart';
import 'package:route_smart/core/common/domain/entites/brand_entity.dart';
import 'package:route_smart/core/common/widgets/smooth_list_view.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/routes/routes_names.dart';
import 'package:route_smart/features/home/presention/widgets/brand_chip.dart';
import 'package:route_smart/features/home/presention/widgets/see_chip_all.dart';

class BrandsListLimited extends StatelessWidget {
  final List<BrandEntity> brands;

  const BrandsListLimited({super.key, required this.brands});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5,
      child: SmoothListView.builder(
        duration: const Duration(milliseconds: 500),
        scrollDirection: Axis.horizontal,

        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: brands.length + 1, // + See All
        itemBuilder: (context, index) {
          if (index >= brands.length) {
            return SeeAllChip(
              onTap: () => context.pushNamed(AppRoutesNames.allBrands),
            );
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
