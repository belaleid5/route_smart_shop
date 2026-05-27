import 'package:flutter/material.dart';
import 'package:route_smart/core/common/domain/entites/category_entity.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/search/presention/widgets/search_brands_empty.dart';
import 'package:route_smart/features/search/presention/widgets/search_list_item.dart';

class SearchCategoriesList extends StatelessWidget {
  const SearchCategoriesList({
    super.key,
    required this.categories,
    this.scrollController,
  });

  final List<CategoryEntity> categories;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return const SearchEmptyState(
        icon: Icons.category_outlined,
        title: LangKeys.noCategoriesFound,
        subtitle: LangKeys.tryDifferentSearch,
      );
    }

    return ListView.builder(
      controller: scrollController,
      shrinkWrap: false,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: SearchListItem(
            imageUrl: category.image ?? '',
            name: category.name,
            subtitle: category.slug ?? '',
            onTap: () {},
          ),
        );
      },
    );
  }
}