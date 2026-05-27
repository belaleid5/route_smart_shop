import 'package:flutter/material.dart';
import 'package:route_smart/core/common/domain/entites/category_entity.dart';
import 'package:route_smart/core/common/widgets/search/search_category_menu_buttn.dart';
import 'package:route_smart/core/common/widgets/search/search_clear_button.dart';
import 'package:route_smart/core/common/widgets/search/search_filter_button.dart';
import 'package:route_smart/core/common/widgets/search/search_input_field.dart';
import 'package:route_smart/core/common/widgets/search/search_refresh_button.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/search/domain/entites/search_params.dart';
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
  final List<CategoryEntity> categories;
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      isScrollControlled: true,
      builder: (_) =>
          SearchFilterBottomSheet(params: params, onApply: onParamsChanged),
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
        horizontalSpace(12),
        Expanded(
          child: SearchInputField(
            controller: controller,
            onChanged: onChanged,
            onSearch: onSearch,
          ),
        ),
        horizontalSpace(12),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: FadeTransition(opacity: animation, child: child),
          ),
          child: _hasActiveFilters
              ? SearchClearButton(
                  key: const ValueKey('clear'),
                  onTap: onCleared,
                )
              : SearchRefreshButton(
                  key: const ValueKey('refresh'),
                  onTap: onCleared,
                ),
        ),
        horizontalSpace(8),
        SearchFilterButton(
          hasActiveFilters: _hasActiveFilters,
          onTap: () => _openFilterSheet(context),
        ),
      ],
    );
  }
}
