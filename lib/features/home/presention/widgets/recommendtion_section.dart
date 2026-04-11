// lib/features/home/presention/widgets/recommended_section.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/widgets/gird_view_shimmer.dart';
import 'package:route_smart/core/common/widgets/product/product_grid_view.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_toast.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/details/presention/widgets/product_details_page.dart';
import 'package:route_smart/features/home/presention/manger/product/product_bloc.dart';
import 'package:route_smart/features/home/presention/manger/product/product_state.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_event.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_state.dart';

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
          builder: (context, productsState) {
            return productsState.maybeWhen(
              loading: () => const GirdViewProductsShimmer(),
              success: (products, hasReachedMax) {
                if (products.isEmpty) {
                  return const Center(child: Text("No products found"))
                      .animateFlipVertical();
                }

                return GridViewProducts(
                  products: products,
                  hasReachedMax: hasReachedMax,
                  onProductTap: (product) =>
                      _navigateToDetails(context, product),
                  onFavoriteTap: (product) =>
                      _handleFavoriteToggle(context, product.id ?? ''),
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

  void _navigateToDetails(BuildContext context, dynamic product) {
 
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<WishlistBloc>(),
          child: ProductDetailsPage(product: product),
        ),
      ),
    );
  }

  void _handleFavoriteToggle(BuildContext context, String productId) {
    if (productId.isEmpty) return;

    final wishlistBloc = context.read<WishlistBloc>();
    final isFavorite = wishlistBloc.state.isFavorite(productId);

    if (isFavorite) {
      wishlistBloc.add(WishlistEvent.removeFromWishlist(productId));
      _showRemovedToast(context);
    } else {
      wishlistBloc.add(WishlistEvent.addToWishlist(productId));
      _showAddedToast(context);
    }
  }

  void _showAddedToast(BuildContext context) {
    CustomToast.showSuccess(context, 'Added to Wishlist');
  }

  void _showRemovedToast(BuildContext context) {
    CustomToast.showError(context, 'Removed from Wishlist');
  }
}