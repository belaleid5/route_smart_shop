import 'package:flutter/material.dart';
import 'package:route_smart/core/common/data/model/category_response_model.dart';
import 'package:route_smart/core/common/widgets/search/search_category_menu_buttn.dart';
import 'package:route_smart/core/common/widgets/search/search_clear_button.dart';
import 'package:route_smart/core/common/widgets/search/search_filter_button.dart';
import 'package:route_smart/core/common/widgets/search/search_input_field.dart';
import 'package:route_smart/core/common/widgets/search/search_reset_icon.dart';
import 'package:route_smart/features/search/presention/manger/search_params.dart';
import 'package:route_smart/features/search/presention/widgets/search_filter_bottom_sheet.dart';

class SearchBarWithFilter extends StatelessWidget {
  const SearchBarWithFilter({
    super.key,
    required this.controller,
    required this.categories,
    required this.selectedCategoryId,
    required this.onCategorySelected,
    required this.onChanged,
    required this.onSearch,
    required this.params,
    required this.onParamsChanged,
    required this.onCleared,
  });

  final TextEditingController controller;
  final List<CategoryData> categories;
  final String? selectedCategoryId;
  final ValueChanged<String?> onCategorySelected;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSearch;
  final SearchFilterParams params;
  final ValueChanged<SearchFilterParams> onParamsChanged;
  final VoidCallback onCleared;

  bool get _hasActiveFilters => params.hasActiveFilters;

  void _openFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => SearchFilterBottomSheet(
        params: params,
        onApply: onParamsChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SearchCategoryMenuButton(
          categories: categories,
          selectedId: selectedCategoryId,
          onSelected: onCategorySelected,
        ),

        const SizedBox(width: 8),

        Expanded(
          child: SearchInputField(
            controller: controller,
            onChanged: onChanged,
            onSearch: onSearch,
          ),
        ),

        const SizedBox(width: 8),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          ),
          child: _hasActiveFilters
              ? SearchClearButton(
                  key: const ValueKey('clear'),
                  onTap: onCleared,
                )
              : SearchResetButton(
                  key: const ValueKey('reset'),
                  onTap: onCleared,
                ),
        ),

        const SizedBox(width: 8),

        SearchFilterButton(
          hasActiveFilters: _hasActiveFilters,
          onTap: () => _openFilterSheet(context),
        ),
      ],
    );
  }
}