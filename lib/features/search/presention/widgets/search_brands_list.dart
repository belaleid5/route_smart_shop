import 'package:flutter/material.dart';
import 'package:route_smart/core/common/domain/entites/brand_entity.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/search/presention/widgets/search_brands_empty.dart';
import 'package:route_smart/features/search/presention/widgets/search_list_item.dart';

class SearchBrandsList extends StatelessWidget {
  const SearchBrandsList({
    super.key,
    required this.brands,
  });

  final List<BrandEntity> brands;

  @override
  Widget build(BuildContext context) {
    if (brands.isEmpty) {
      return SearchEmptyState(
        icon: Icons.store_outlined,
        title: context.translate(LangKeys.noBrandsAvailable),
        subtitle: context.translate(LangKeys.tryDifferentSearch),
      );
    }


    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      physics: const BouncingScrollPhysics(),
      itemCount: brands.length,
      itemBuilder: (context, index) {
        final brand = brands[index];
        final durationMs = (300 + (index * 50)).clamp(300, 800);

        return SearchListItem(
          imageUrl: brand.image ?? '',
          name: brand.name,
          subtitle: brand.slug ?? '',
        ).animateRightLeft(
          duration: Duration(milliseconds: durationMs),
        );
      },
    );
  }
}