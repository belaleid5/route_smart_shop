// lib/features/search/presentation/widgets/search_filter_chips.dart

import 'package:flutter/material.dart';
import 'package:route_smart/features/search/presention/widgets/clear_chip.dart';
import 'package:route_smart/core/constants/search_constants.dart';
import 'package:route_smart/features/search/presention/widgets/sort_chip.dart';

class SearchFilterChips extends StatelessWidget {
  const SearchFilterChips({
    super.key,
    required this.selectedSort,
    required this.onSortChanged,
    required this.onCleared,
  });

  final String? selectedSort;
  final ValueChanged<String?> onSortChanged;
  final VoidCallback onCleared;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: SearchConstants.sortOptions.map((opt) {
                  final isSelected = selectedSort == opt.value;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: SearchSortChip(
                      label: opt.label,
                      isSelected: isSelected,
                      icon: Icons.filter_list,
                      onTap: () => onSortChanged(isSelected ? null : opt.value),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          if (selectedSort != null) ...[
            const SizedBox(width: 8),
            SearchClearChip(onTap: onCleared),
          ],
        ],
      ),
    );
  }
}
