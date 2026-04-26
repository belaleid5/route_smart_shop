// lib/features/search/presention/widgets/search_categories_list.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/common/data/model/category_response_model.dart';
import 'package:route_smart/core/common/widgets/smooth_list_view.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/search/presention/widgets/search_brands_empty.dart';
import 'package:route_smart/features/search/presention/widgets/search_list_item.dart';

class SearchCategoriesList extends StatelessWidget {
  const SearchCategoriesList({super.key, required this.categories});

  final List<CategoryData> categories;

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return SearchEmptyState(
        icon:     Icons.category_outlined,
        title:    context.translate('no_categories_found'),
        subtitle: context.translate('try_different_search'),
      );
    }

    return SmoothListView.builder(
      duration:    const Duration(milliseconds: 400),
      shrinkWrap:  true,
      physics:     const NeverScrollableScrollPhysics(),
      padding:     const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount:   categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return SearchListItem(
          imageUrl: category.image ?? '',
          name:     category.name  ?? '',
          subtitle: category.slug  ?? '',
        ).animateRightLeft(
          duration: Duration(milliseconds: 300 + (index * 50)),
        );
      },
    );
  }
}