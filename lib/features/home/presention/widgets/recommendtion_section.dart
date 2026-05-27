import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/domain/entites/product_entity.dart';
import 'package:route_smart/core/common/widgets/product/product_grid_view.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/wishlist_extention.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/core/routes/routes_names.dart';

import 'package:route_smart/features/home/presention/manger/product/product_bloc.dart';
import 'package:route_smart/features/home/presention/manger/product/product_state.dart';
import 'package:route_smart/features/home/presention/widgets/gride_view_shimmer.dart';


class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  void _navigateToDetails(BuildContext context, ProductEntity product) {
    context.pushNamed(AppRoutesNames.productDetails, arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            context.translate(LangKeys.recommendedForYou), 
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ).animateRightLeft(isFromStart: false),
        ),
        verticalSpace(20),

        SizedBox(
          height: 520, 
          child: BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              return switch (state) {
                ProductsLoading() => GirdViewProductsShimmer(),

                ProductsError(:final message) => Center(
                    child: Text(
                      message,
                      style: TextStyle(color: context.colors.textSecondary),
                    ).animateShakeAlarm(),
                  ),

                ProductsSuccess(:final products, :final hasReachedMax) => 
                  products.isEmpty
                      ? Center(
                          child: Text(
                            context.translate(LangKeys.noProductsFound),
                            style: TextStyle(color: context.colors.textSecondary),
                          ).animateFlipVertical(),
                        )
                      : GridViewProducts(
                          products: products,
                          hasReachedMax: hasReachedMax,
                          onProductTap: (product) => _navigateToDetails(context, product),
                          onFavoriteTap: (product) => context.toggleWishlistItem(product.id),
                         onAddToCartTap: (product) {
                             // context.read<CartBloc>().add(CartEvent.addToCart(product.id!));
                          },
                        ),

                _ => const SizedBox.shrink(),
              };
            },
          ),
        ),
      ],
    );
  }
}