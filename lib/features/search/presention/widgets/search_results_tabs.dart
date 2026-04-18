import 'package:flutter/material.dart';
import 'package:route_smart/features/search/presention/manger/search_params.dart';
import 'package:route_smart/features/search/presention/manger/search_state.dart';
import 'package:route_smart/features/search/presention/widgets/saerch_tap_content.dart';
import 'package:route_smart/features/search/presention/widgets/search_results_summary.dart';
import 'package:route_smart/features/search/presention/widgets/search_tap_bar.dart';

class SearchResultsTabs extends StatelessWidget {
  const SearchResultsTabs({
    super.key,
    required this.state,
    required this.scrollController,
    required this.keyword,
    required this.onTabChanged,
  });

  final SearchSuccess state;
  final ScrollController scrollController;
  final String keyword;
  final ValueChanged<SearchTab> onTabChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTabBar(
          activeTab: state.params.activeTab,
          totalProducts: state.totalProducts,
          totalBrands: state.totalBrands,
          totalCategories: state.totalCategories,
          onTabChanged: onTabChanged,
        ),
        SearchResultsSummary(
          total: state.totalProducts,
          limit: state.params.limit,
        ),
        SearchTabContent(
          state: state,
          keyword: keyword,
        ),
      ],
    );
  }
}