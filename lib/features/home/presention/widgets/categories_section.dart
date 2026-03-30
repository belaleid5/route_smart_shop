// features/home/presention/widgets/categories_section.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/widgets/smooth_list_view.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_shimmer.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/home/presention/manger/categroy/categories_bloc.dart';
import 'package:route_smart/features/home/presention/manger/categroy/categories_event.dart';
import 'package:route_smart/features/home/presention/manger/categroy/categories_state.dart';
import 'package:route_smart/features/home/presention/widgets/category_item.dart';
import 'package:route_smart/features/home/presention/widgets/header_section.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderSection(title: 'Categories'),
        verticalSpace(16),
        SizedBox(
          height: 120,
          child: BlocBuilder<CategoriesBloc, CategoriesState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => SmoothListView.separated(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOutQuart,
                  smoothScroll: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  separatorBuilder: (_, __) => horizontalSpace(16),
                  itemBuilder: (context, index) {
                    return const ShimmerBrandItem(size: 70)
                    .animateBottomToTop(
                      duration: Duration(milliseconds: 300 + (index * 50)),
                    );
                  },
                ),
                
                error: (message) => Center(
                  child: Text(
                    message,
                    style: context.textStyle.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                ).animateShakeAlarm(),

                success: (categories, hasReachedMax) {
                  if (categories.isEmpty) {
                    return const Center(
                      child: Text('No categories found.'),
                    ).animateFlipVertical();
                  }

                  return SmoothListView.separated(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOutQuart,
                    smoothScroll: true,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    separatorBuilder: (_, __) => horizontalSpace(16),
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return CategoryItem(
                        category: category,
                      )
                      .animateBottomToTop(
                        duration: Duration(milliseconds: 300 + (index * 50)),
                      );
                    },
                  );
                },

                orElse: () {
                  context.read<CategoriesBloc>().add(
                    const GetCategoriesEvent(),
                  );
                  return SmoothListView.separated(
                    smoothScroll: true,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    separatorBuilder: (_, __) => horizontalSpace(16),
                    itemBuilder: (context, index) =>
                        const ShimmerBrandItem(size: 70)
                        .animateBottomToTop(
                          duration: Duration(milliseconds: 300 + (index * 50)),
                        ), duration: Duration(milliseconds:1200),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}