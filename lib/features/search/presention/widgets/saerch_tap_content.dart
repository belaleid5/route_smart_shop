// lib/features/search/presentation/widgets/search_tab_content.dart
import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/product/product_grid_view.dart';
import 'package:route_smart/features/search/presention/manger/search_params.dart';
import 'package:route_smart/features/search/presention/manger/search_state.dart';
import 'package:route_smart/features/search/presention/widgets/search_brands_list.dart';
import 'package:route_smart/features/search/presention/widgets/search_category_grid_view.dart';

class SearchTabContent extends StatelessWidget {
  const SearchTabContent({super.key, required this.state});

  final SearchSuccess state;

  @override
  Widget build(BuildContext context) {
    return switch (state.params.activeTab) {
      SearchTab.products => GridViewProducts(
        products: state.products,
        hasReachedMax: state.isLoadingMore,
      ),
      SearchTab.categories => SearchCategoriesList(
        categories: state.categories,
      ),
      SearchTab.brands => SearchBrandsList(brands: state.brands),
    };
  }
}
