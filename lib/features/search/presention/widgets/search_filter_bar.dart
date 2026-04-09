import 'package:flutter/material.dart';
import 'package:route_smart/core/common/data/model/category_response_model.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';
import 'package:route_smart/features/search/presention/manger/search_params.dart';
import 'package:route_smart/features/search/presention/widgets/search_bar_item.dart';
import 'package:route_smart/features/search/presention/widgets/search_category_menu.dart';

class SearchFilterBar extends StatelessWidget {
  const SearchFilterBar({
    super.key,
    required this.params,
    required this.categories,
    required this.onCategorySelected,
    required this.onSortChanged,
    required this.onCleared,
  });

  final SearchFilterParams params;
  final List<CategoryData> categories;
  final ValueChanged<String?> onCategorySelected;
  final ValueChanged<String?> onSortChanged;
  final VoidCallback onCleared;

  // ─── Active Filters Count ─────────────────────────────────────────────────
  int get _activeFiltersCount => [
        params.categoryId,
        params.sort,
        params.minPrice,
        params.maxPrice,
        params.brandId,
      ].where((f) => f != null).length;

  bool get _hasActiveFilters => _activeFiltersCount > 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          // ── Clear Button (يظهر لو فيه filters) ───────────────────────────
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutCubic,
            child: _hasActiveFilters
                ? Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: _ClearButton(onTap: onCleared),
                  )
                : const SizedBox.shrink(),
          ),

          // ── Category Menu ─────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SearchCategoryMenu(
              categories: categories,
              selectedId: params.categoryId,
              onSelected: onCategorySelected,
            ),
          ),

          // ── Sort Button ───────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SearchFilterBarItem(
              label: _sortLabel,
              icon: Icons.swap_vert_rounded,
              isSelected: params.sort != null,
              badgeCount: params.sort != null ? 1 : null,
              onTap: () => _showSortSheet(context),
            ),
          ),

          // ── Price Filter ──────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SearchFilterBarItem(
              label: 'Price',
              icon: Icons.attach_money_rounded,
              isSelected: params.minPrice != null || params.maxPrice != null,
              badgeCount: [params.minPrice, params.maxPrice]
                      .where((p) => p != null)
                      .length
                  .let((c) => c > 0 ? c : null),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  // ─── Sort Label ────────────────────────────────────────────────────────────
  String get _sortLabel => switch (params.sort) {
        '-price' => 'Price ↓',
        'price'  => 'Price ↑',
        '-sold'  => 'Popular',
        '-rate'  => 'Top Rated',
        _        => 'Sort',
      };

  // ─── Sort Bottom Sheet ─────────────────────────────────────────────────────
  void _showSortSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => _SortBottomSheet(
        selectedSort: params.sort,
        onSelected: onSortChanged,
      ),
    );
  }
}

// ─── Clear Button ──────────────────────────────────────────────────────────────
class _ClearButton extends StatelessWidget {
  const _ClearButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: context.color.primary
          .withValues(alpha: 0.08),
          border: Border.all(
            color: context.color.primary
            .withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.close_rounded,
              size: 16,
              color: context.color.primary
              ,
            ),
            const SizedBox(width: 6),
            Text(
              'Clear',
              style: context.textStyle.copyWith(
                fontSize: 13,
                fontWeight: FontWeightHelper.medium,
                color: context.color.primary
                ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Sort Bottom Sheet ─────────────────────────────────────────────────────────
class _SortBottomSheet extends StatelessWidget {
  const _SortBottomSheet({
    required this.selectedSort,
    required this.onSelected,
  });

  final String? selectedSort;
  final ValueChanged<String?> onSelected;

  static const _sortOptions = [
    (label: 'Default',    value: null,     icon: Icons.sort_rounded),
    (label: 'Price ↓',   value: '-price',  icon: Icons.arrow_downward_rounded),
    (label: 'Price ↑',   value: 'price',   icon: Icons.arrow_upward_rounded),
    (label: 'Popular',   value: '-sold',   icon: Icons.local_fire_department_rounded),
    (label: 'Top Rated', value: '-rate',   icon: Icons.star_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
      decoration: BoxDecoration(
        color: context.color.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Handle ──────────────────────────────────────────────────────
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: context.color.stroke,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ── Title ────────────────────────────────────────────────────────
          Row(
            children: [
              Icon(
                Icons.swap_vert_rounded,
                color: context.color.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Sort By',
                style: context.textStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeightHelper.semiBold,
                  color: context.color.textPrimary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // ── Options ──────────────────────────────────────────────────────
          ..._sortOptions.map(
            (option) => _SortOptionItem(
              label: option.label,
              icon: option.icon,
              isSelected: selectedSort == option.value,
              onTap: () {
                onSelected(option.value);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Sort Option Item ──────────────────────────────────────────────────────────
class _SortOptionItem extends StatelessWidget {
  const _SortOptionItem({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 4),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected
              ? context.color.primary.withValues(alpha: 0.08)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            // ── Icon ──────────────────────────────────────────────────────
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? context.color.primary.withValues(alpha: 0.12)
                    : context.color.stroke.withValues(alpha: 0.5),
              ),
              child: Icon(
                icon,
                size: 16,
                color: isSelected
                    ? context.color.primary
                    : context.color.textPrimary.withValues(alpha: 0.5),
              ),
            ),

            const SizedBox(width: 12),

            // ── Label ────────────────────────────────────────────────────
            Expanded(
              child: Text(
                label,
                style: context.textStyle.copyWith(
                  fontSize: 14,
                  fontWeight: isSelected
                      ? FontWeightHelper.semiBold
                      : FontWeightHelper.medium,
                  color: isSelected
                      ? context.color.primary
                      : context.color.textPrimary,
                ),
              ),
            ),

            // ── Check ────────────────────────────────────────────────────
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              child: isSelected
                  ? Icon(
                      Icons.check_circle_rounded,
                      key: const ValueKey('check'),
                      color: context.color.primary,
                      size: 20,
                    )
                  : const SizedBox(
                      key: ValueKey('empty'),
                      width: 20,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Extension ────────────────────────────────────────────────────────────────
extension _Let<T> on T {
  R let<R>(R Function(T) block) => block(this);
}