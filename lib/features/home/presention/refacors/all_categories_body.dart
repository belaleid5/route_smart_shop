import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/routes/routes_names.dart';
import 'package:route_smart/features/home/presention/manger/categroy/categories_bloc.dart';
import 'package:route_smart/features/home/presention/manger/categroy/categories_state.dart';

import '../widgets/categories_empty_state.dart';
import '../widgets/categories_error_state.dart';
import '../widgets/categories_shimmer_grid.dart';
import '../widgets/category_item.dart';

class AllCategoriesBody extends StatelessWidget {
  const AllCategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        return switch (state) {
          CategoriesInitial() ||
          CategoriesLoading() => const CategoriesShimmerGrid(),

          CategoriesError(:final message) => CategoriesErrorState(
            message: message,
          ),

          CategoriesSuccess(:final categories) =>
            categories.isEmpty
                ? const CategoriesEmptyState()
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.85,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                    itemCount: categories.length,
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
                        duration: Duration(milliseconds: 300 + (index * 30)),
                      );
                    },
                  ),
        };
      },
    );
  }
}
