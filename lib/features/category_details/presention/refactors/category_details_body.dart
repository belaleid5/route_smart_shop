// lib/features/category_details/presentation/refactors/category_details_body.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_shimmer.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/category_details/presention/manger/category_details_cubit.dart';
import 'package:route_smart/features/category_details/presention/manger/category_details_state.dart';
import 'package:route_smart/features/category_details/presention/widgets/subcategory_grid.dart';

class CategoryDetailsBody extends StatelessWidget {
  const CategoryDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsBloc, CategoryDetailsState>(
      builder: (context, state) {
        switch (state) {
          case CategoryDetailsInitial():
            return const SizedBox.shrink();

          case CategoryDetailsLoading():
            return _buildShimmerGrid();

          case CategoryDetailsLoaded(:final subcategories):
            if (subcategories.isEmpty) {
              return Center(
                child: Text(
                  context.translate(
                    LangKeys.noSubcategoriesFound,
                  ),
                  style: context.bodyMedium.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
              );
            }

            return SubcategoryGrid(
              subcategories: subcategories,
            );

          case CategoryDetailsError(:final message):
            return Center(
              child: Text(
                message,
                style: context.bodyMedium.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
            );
        }
      },
    );
  }

  Widget _buildShimmerGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.1,
      ),
      itemCount: 6,
      itemBuilder: (_, __) => ShimmerWidget(
        height: 150,
        width: double.infinity,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}