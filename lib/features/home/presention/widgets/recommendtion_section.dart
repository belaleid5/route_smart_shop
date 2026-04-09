import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/widgets/gird_view_shimmer.dart';
import 'package:route_smart/core/common/widgets/product/product_grid_view.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/home/presention/manger/product/product_bloc.dart';
import 'package:route_smart/features/home/presention/manger/product/product_state.dart';

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
              loading: () => GirdViewProductsShimmer(),
              success: (products, hasReachedMax) {
                if (products.isEmpty) {
                  return const Center(
                    child: Text("No products found"),
                  ).animateFlipVertical();
                }

                return GridViewProducts(products: products);
              },
              error: (message) =>
                  Center(child: Text(message)).animateShakeAlarm(),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ],
    );
  }
}
