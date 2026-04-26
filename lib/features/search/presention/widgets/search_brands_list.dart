import 'package:flutter/material.dart';
import 'package:route_smart/core/common/data/model/brand_response_model.dart';
import 'package:route_smart/core/common/widgets/smooth_list_view.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/features/search/presention/widgets/search_brands_empty.dart';
import 'package:route_smart/features/search/presention/widgets/search_list_item.dart';

class SearchBrandsList extends StatelessWidget {
  const SearchBrandsList({super.key, required this.brands});

  final List<BrandData> brands;

  @override
  Widget build(BuildContext context) {
    if (brands.isEmpty) {
      return const SearchEmptyState(
        icon:     Icons.store_outlined,
        title:    'No brands found',
        subtitle: 'Try a different search term',
      ).animateBlur();
    }

    return SmoothListView.builder(
      duration:    const Duration(milliseconds: 400),
      shrinkWrap:  true,
      physics:     const NeverScrollableScrollPhysics(),
      padding:     const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount:   brands.length,
      itemBuilder: (context, index) {
        final brand = brands[index];
        return SearchListItem(
          imageUrl: brand.image ?? '',
          name:     brand.name  ?? '',
          subtitle: brand.slug  ?? '',
        ).animateRightLeft(
          duration: Duration(milliseconds: 300 + (index * 50)),
        );
      },
    );
  }
}