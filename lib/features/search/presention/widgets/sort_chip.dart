import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/features/search/presention/widgets/search_chip_icon.dart';
import 'package:route_smart/features/search/presention/widgets/search_chip_label.dart';

class SearchSortChip extends StatelessWidget {
  const SearchSortChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final selectedColor = context.colors.primary;
    final unselectedColor = context.colors.fieldBackground;
    final chipColor = isSelected
        ? selectedColor.withValues(alpha: 0.15)
        : unselectedColor;
    final contentColor = isSelected
        ? selectedColor
        : context.colors.textSecondary;
    final borderColor = isSelected ? selectedColor : context.colors.stroke;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: chipColor,
          border: Border.all(color: borderColor),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SearchChipIcon(icon: icon, color: contentColor),
            const SizedBox(width: 6),
            SearchChipLabel(label: label, color: contentColor),
          ],
        ),
      ),
    );
  }
}
