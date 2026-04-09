import 'package:flutter/material.dart';
import 'package:route_smart/core/common/data/model/category_response_model.dart';
import 'package:route_smart/core/common/widgets/search/search_title.dart';
import 'package:route_smart/features/search/presention/manger/search_params.dart';
import 'package:route_smart/core/common/widgets/search/search_bar_with_filter.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    super.key,
    required this.controller,
    required this.onSearch,
    required this.onChanged,
    required this.categories,
    required this.selectedCategoryId,
    required this.onCategorySelected,
    required this.params,
    required this.onParamsChanged,
    required this.onCleared,
  });

  final TextEditingController controller;
  final ValueChanged<String> onSearch;
  final ValueChanged<String> onChanged;
  final List<CategoryData> categories;
  final String? selectedCategoryId;
  final ValueChanged<String?> onCategorySelected;
  final SearchFilterParams params;
  final ValueChanged<SearchFilterParams> onParamsChanged;
  final VoidCallback onCleared;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchTitle(),

          const SizedBox(height: 16),

          SearchBarWithFilter(
            controller: controller,
            categories: categories,
            selectedCategoryId: selectedCategoryId,
            onCategorySelected: onCategorySelected,
            onChanged: onChanged,
            onSearch: onSearch,
            params: params,
            onParamsChanged: onParamsChanged,
            onCleared: onCleared,
          ),
        ],
      ),
    );
  }
}