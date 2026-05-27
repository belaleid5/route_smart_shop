import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/domain/entites/category_entity.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/search/domain/entites/search_params.dart';
import 'package:route_smart/features/search/presention/widgets/search_bar_item.dart';
import 'package:route_smart/features/search/presention/widgets/search_category_menu.dart';
import 'package:route_smart/features/search/presention/widgets/search_filter_bottom_sheet.dart';
import 'package:route_smart/features/search/presention/widgets/search_filter_clear_button.dart';

class SearchFilterBar extends StatelessWidget {
  const SearchFilterBar({
    super.key,
    required this.params,
    required this.categories,
    required this.onCategorySelected,
    required this.onSortChanged,
    required this.onCleared,
    this.onPriceTap,
  });

  final SearchFilterParams params;
  final List<CategoryEntity> categories;
  final ValueChanged<String?> onCategorySelected;
  final ValueChanged<String?> onSortChanged;
  final VoidCallback onCleared;
  final VoidCallback? onPriceTap;

  bool get _hasActiveFilters => <Object?>[
    params.categoryId,
    params.sort,
    params.minPrice,
    params.maxPrice,
    params.brandId,
  ].any((filter) => filter != null);

  int get _priceFiltersCount =>
      (params.minPrice != null ? 1 : 0) + (params.maxPrice != null ? 1 : 0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutCubic,
            child: _hasActiveFilters
                ? Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: SearchFilterClearButton(onTap: onCleared),
                  )
                : const SizedBox.shrink(),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SearchCategoryMenu(
              categories: categories,
              selectedId: params.categoryId,
              onSelected: onCategorySelected,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SearchFilterBarItem(
              label: _sortLabel(context),
              icon: Icons.swap_vert_rounded,
              isSelected: params.sort != null,
              badgeCount: params.sort != null ? 1 : null,
              onTap: () => _showSortSheet(context),
            ),
          ),
          if (onPriceTap != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SearchFilterBarItem(
                label: context.translate(LangKeys.price),
                icon: Icons.attach_money_rounded,
                isSelected: params.minPrice != null || params.maxPrice != null,
                badgeCount: _priceFiltersCount > 0 ? _priceFiltersCount : null,
                onTap: onPriceTap!,
              ),
            ),
        ],
      ),
    );
  }

  String _sortLabel(BuildContext context) => switch (params.sort) {
    '-price' => context.translate(LangKeys.sortPriceHigh),
    'price' => context.translate(LangKeys.sortPriceLow),
    '-sold' => context.translate(LangKeys.sortPopular),
    '-rate' => context.translate(LangKeys.sortTopRated),
    _ => context.translate(LangKeys.sort),
  };

  void _showSortSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: context.colors.surface.withValues(alpha: 0),
      builder: (_) => SearchFilterBottomSheet(
        params: params,
        onApply: (newParams) => onSortChanged(newParams.sort),
      ),
    );
  }
}
