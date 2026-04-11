// lib/features/search/presention/widgets/search_tap_content.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/data/model/product_data_model.dart';
import 'package:route_smart/core/common/widgets/product/product_grid_view.dart';
import 'package:route_smart/core/extensions/wishlist_extention.dart';
import 'package:route_smart/features/details/presention/widgets/product_details_page.dart';
import 'package:route_smart/features/search/presention/manger/search_params.dart';
import 'package:route_smart/features/search/presention/manger/search_state.dart';
import 'package:route_smart/features/search/presention/widgets/search_brands_list.dart';
import 'package:route_smart/features/search/presention/widgets/search_category_grid_view.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';

class SearchTabContent extends StatelessWidget {
  const SearchTabContent({super.key, required this.state});

  final SearchSuccess state;

  @override
  Widget build(BuildContext context) {
    return switch (state.params.activeTab) {
      SearchTab.products => GridViewProducts(
          products: state.products,
          hasReachedMax: state.isLoadingMore,
          
          onProductTap: (product) => _navigateToDetails(context, product),
          
          onFavoriteTap: (product) => context.toggleWishlist(
            product.id ?? '',
          ),
        ),
      
      SearchTab.categories => SearchCategoriesList(
          categories: state.categories,
        ),
      
      SearchTab.brands => SearchBrandsList(
          brands: state.brands,
        ),
    };
  }

  void _navigateToDetails(BuildContext context, ProductDataModel product) {
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
}