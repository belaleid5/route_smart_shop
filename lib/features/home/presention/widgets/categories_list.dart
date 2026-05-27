import 'package:flutter/material.dart';
import 'package:route_smart/core/common/domain/entites/category_entity.dart';
import 'package:route_smart/core/common/widgets/smooth_list_view.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/routes/routes_names.dart';
import 'package:route_smart/features/home/presention/widgets/category_item.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key, required this.categories});

  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    return SmoothListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: categories.length,
      separatorBuilder: (_, __) => horizontalSpace(16),
      itemBuilder: (context, index) {
        final category = categories[index];
        return CategoryItem(
          category: category,
          onTap: () => Navigator.pushNamed(
            context,
            AppRoutesNames.filteredProducts,
            arguments: {
              'title': category.name,
              'categoryId': category.id,
              'brandId': null,
            },
          ),
        ).animateBottomToTop(
          duration: Duration(milliseconds: 300 + index * 50),
        );
      },
      duration: Duration(milliseconds: 300),
    );
  }
}
