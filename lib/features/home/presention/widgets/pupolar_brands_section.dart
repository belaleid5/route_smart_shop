import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/core/routes/routes_names.dart';
import 'package:route_smart/features/home/presention/manger/brand/brands_bloc.dart';
import 'package:route_smart/features/home/presention/manger/brand/brands_state.dart';
import 'package:route_smart/features/home/presention/widgets/brand_loading_row.dart';
import 'package:route_smart/features/home/presention/widgets/header_section.dart';
import 'package:route_smart/features/home/presention/widgets/prands_list.dart';

class PopularBrandsSection extends StatelessWidget {
  const PopularBrandsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderSection(
          title: context.translate(LangKeys.popularBrands),
          onTapSeeAll: () => context.pushNamed(AppRoutesNames.allBrands),
        ).animateRightLeft(isFromStart: false),

        verticalSpace(16),

        SizedBox(
          height: 40,
          child: BlocBuilder<BrandsBloc, BrandsState>(
            builder: (context, state) {
              return switch (state) {
                BrandsInitial() => const SizedBox.shrink(),

                BrandsLoading() => const BrandsLoadingRow(),

                BrandsError(:final message) => Center(
                  child: Text(message, style: TextStyle(color: Colors.red)),
                ),

                BrandsSuccess(:final brands) =>
                  brands.isEmpty
                      ? Center(
                          child: Text(
                            context.translate(LangKeys.noBrandsAvailable),
                            style: TextStyle(
                              color: context.colors.textSecondary,
                            ),
                          ),
                        )
                      : BrandsListLimited(brands: brands.take(6).toList()),
              };
            },
          ),
        ),
      ],
    );
  }
}
