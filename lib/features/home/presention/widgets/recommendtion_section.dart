
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/widgets/grid_view.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_shimmer.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/home/presention/manger/product/product_bloc.dart';
import 'package:route_smart/features/home/presention/manger/product/product_state.dart';
import 'package:route_smart/features/home/presention/widgets/product_grid_view.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Recommended for you',
            style: context.textStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        verticalSpace(16),
        BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => PaginatedGridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                itemCount: 4, 
                hasMore: false, 
                itemBuilder: (context, index) {
                  return const ShimmerGridItem(
                    imageHeight: 140, 
                  ).animateBottomToTop(
                    duration: Duration(milliseconds: 300 + (index * 50)),
                  );
                },
              ),
              success: (products, hasReachedMax) {
                if (products.isEmpty) {
                  return const Center(child: Text("No products found"))
                      .animateFlipVertical();
                }

                return PaginatedGridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  itemCount: products.length,
                  hasMore: hasReachedMax,
                  itemBuilder: (context, index) {
                    return ProductGridCard(
                      product: products[index],
                    ).animateBottomToTop(
                      duration: Duration(milliseconds: 300 + (index * 50)),
                    );
                  },
                );
              },
              error: (message) => Center(child: Text(message))
                  .animateShakeAlarm(),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ],
    );
  }
}