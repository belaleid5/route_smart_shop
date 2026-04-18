import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/data/model/product_data_model.dart';
import 'package:route_smart/core/common/widgets/product/product_grid_view.dart';
import 'package:route_smart/core/extensions/cart_extenions.dart';
import 'package:route_smart/core/extensions/wishlist_extention.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/details/presention/page/product_details_page.dart';
import 'package:route_smart/features/search/presention/manger/search_params.dart';
import 'package:route_smart/features/search/presention/manger/search_state.dart';
import 'package:route_smart/features/search/presention/widgets/search_brands_list.dart';
import 'package:route_smart/features/search/presention/widgets/search_category_grid_view.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';

class SearchTabContent extends StatelessWidget {
  const SearchTabContent({
    super.key,
    required this.state,
    required this.keyword,
  });

  final SearchSuccess state;
  final String keyword;

  List<ProductDataModel> _filterProducts(List<ProductDataModel> products) {
    final q = keyword.trim().toLowerCase();
    if (q.isEmpty) return products;

    return products.where((product) {
      final title = (product.title ?? '').toLowerCase();
      final brand = (product.brand?.name ?? '').toLowerCase();
      final category = (product.category?.name ?? '').toLowerCase();

      return title.startsWith(q) ||
          brand.startsWith(q) ||
          category.startsWith(q);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = _filterProducts(state.products);

    return switch (state.params.activeTab) {
      SearchTab.products => GridViewProducts(
          products: filteredProducts,
          hasReachedMax: state.isLoadingMore,
          onProductTap: (product) => _navigateToDetails(context, product),
          onFavoriteTap: (product) =>
              context.toggleWishlist(product.id ?? ''),
              onAddToCartTap: (product) => context.toggleCart(product.id ?? ''),
        ),

      SearchTab.categories => SearchCategoriesGridView(
          categories: state.categories.where((category) {
            final q = keyword.trim().toLowerCase();
            if (q.isEmpty) return true;
            return (category.name ?? '').toLowerCase().startsWith(q);
          }).toList(),
        ),

      SearchTab.brands => SearchBrandsList(
          brands: state.brands.where((brand) {
            final q = keyword.trim().toLowerCase();
            if (q.isEmpty) return true;
            return (brand.name ?? '').toLowerCase().startsWith(q);
          }).toList(),
        ),
    };
  }

  void _navigateToDetails(BuildContext context, ProductDataModel product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: context.read<WishlistBloc>()),
            BlocProvider.value(value: context.read<CartBloc>()),
          ],
          child: ProductDetailsPage(product: product),
        ),
      ),
    );
  }
}