import 'package:flutter/material.dart';
import 'package:route_smart/core/common/data/model/category_response_model.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/search/presention/widgets/search_brands_empty.dart';
import 'package:route_smart/features/search/presention/widgets/search_list_item.dart';

class SearchCategoriesGridView extends StatelessWidget {
  const SearchCategoriesGridView({
    super.key,
    required this.categories,
  });

  final List<CategoryData> categories;

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: SearchEmptyState(
          icon: Icons.category_outlined,
          title: context.translate(LangKeys.noCategoriesFound),
          subtitle: context.translate(LangKeys.tryDifferentSearch),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.75,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final category = categories[index];
            return SearchListItem(
              onTap: () {},
              imageUrl: category.image ?? '',
              name: category.name,
              subtitle: category.slug ?? '',
            ).animateRightLeft(
              duration: Duration(milliseconds: 300 + (index * 50)),
            );
          },
          childCount: categories.length,
        ),
      ),
    );
  }
}