 
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/core/routes/routes_names.dart';
import 'package:route_smart/features/home/presention/manger/categroy/categories_bloc.dart';
import 'package:route_smart/features/home/presention/manger/categroy/categories_state.dart';
import 'package:route_smart/features/home/presention/widgets/header_section.dart';
import 'categories_list.dart';
import 'categories_shimmer.dart';
 
class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderSection(
          title: context.translate(LangKeys.categories),
          onTapSeeAll: () => context.pushNamed(AppRoutesNames.allCategories),
        ),
        verticalSpace(16),
        SizedBox(
          height: 120,
          child: BlocBuilder<CategoriesBloc, CategoriesState>(
            builder: (context, state) {
              if (kDebugMode) print('🔴 CategoriesSection BlocBuilder: ${state.runtimeType}');
 
              return switch (state) {
                CategoriesInitial() ||
                CategoriesLoading() => const CategoriesShimmer(),
                CategoriesError(:final message) => Center(child: Text(message)),
                CategoriesSuccess(:final categories) => categories.isEmpty
                    ? Center(
                        child: Text(
                          context.translate(LangKeys.noCategoriesFound),
                        ),
                      )
                    : CategoriesList(categories: categories.take(5).toList()),
              };
            },
          ),
        ),
      ],
    );
  }
}