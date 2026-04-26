import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/widgets/gird_view_shimmer.dart';
import 'package:route_smart/core/common/widgets/product/product_grid_view.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/cart_extenions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/wishlist_extention.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/details/presention/page/product_details_page.dart';
import 'package:route_smart/features/home/presention/manger/product/product_bloc.dart';
import 'package:route_smart/features/home/presention/manger/product/product_state.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  void _navigateToDetails(BuildContext context, dynamic product) {
    context.push(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: context.read<WishlistBloc>()),
          BlocProvider.value(value: context.read<CartBloc>()),
        ],
        child: ProductDetailsPage(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            context.translate(LangKeys.recommendedForYou),
            style: context.textStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ).animateRightLeft(isFromStart: false),
        ),
        verticalSpace(16),
        BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, productsState) {
            return productsState.maybeWhen(
              loading: () => const GirdViewProductsShimmer(),
              success: (products, hasReachedMax) {
                if (products.isEmpty) {
                  return Center(
                    child: Text(
                      context.translate(LangKeys.noProductsFound),
                    ),
                  ).animateFlipVertical();
                }
                return GridViewProducts(
                  products: products,
                  hasReachedMax: hasReachedMax,
                  onProductTap: (product) =>
                      _navigateToDetails(context, product),
                  onFavoriteTap: (product) =>
                      context.toggleWishlist(product.id ?? ''),
                  onAddToCartTap: (product) =>
                      context.toggleCart(product.id ?? ''),
                );
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