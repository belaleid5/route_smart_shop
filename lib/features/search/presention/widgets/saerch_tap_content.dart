import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/product/product_grid_view.dart';
import 'package:route_smart/core/extensions/cart_extenions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/wishlist_extention.dart';
import 'package:route_smart/core/routes/routes_names.dart';
import 'package:route_smart/features/search/domain/entites/search_params.dart';
import 'package:route_smart/features/search/presention/manger/search_state.dart';
import 'package:route_smart/features/search/presention/widgets/seach_cateogries_list.dart';
import 'package:route_smart/features/search/presention/widgets/search_brands_list.dart';

class SearchTabContent extends StatelessWidget {
  const SearchTabContent({
    super.key,
    required this.state,
    required this.scrollController,
  });

  final SearchSuccess state;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return switch (state.params.activeTab) {
      SearchTab.products => GridViewProducts(
          products: state.products,
          hasReachedMax: state.hasReachedMax,
          onProductTap: (product) => context.pushNamed(
            AppRoutesNames.productDetails,
            arguments: product,
          ),
          onFavoriteTap: (product) => context.toggleWishlistItem(product.id),
          onAddToCartTap: (product) => context.addToCart(product.id),
        ),

      SearchTab.categories => SearchCategoriesList(
          categories: state.categories,
        ),


      SearchTab.brands => SearchBrandsList(
          brands: state.brands,
        ),
    };
  }
}