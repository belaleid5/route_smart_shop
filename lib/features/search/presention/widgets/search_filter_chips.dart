import 'package:flutter/material.dart';
import 'package:route_smart/core/constants/search_constants.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/search/presention/widgets/clear_chip.dart';
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
                children: SearchConstants.sortOptions.map((option) {
                  final labelKey = option['label'] ?? '';
                  final sortValue = option['value'];
                  final normalizedSortValue =
                      sortValue == null || sortValue.isEmpty ? null : sortValue;

                  final isSelected = selectedSort == normalizedSortValue;

                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: SortChip(
                      label: context.translate(labelKey),
                      isSelected: isSelected,
                      icon: Icons.filter_list,
                      onTap: () {
                        onSortChanged(
                          isSelected ? null : normalizedSortValue,
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          if (selectedSort != null) ...[
            const SizedBox(width: 8),
            SearchClearChip(
              
              onTap: onCleared),
          ],
        ],
      ),
    );
  }
}