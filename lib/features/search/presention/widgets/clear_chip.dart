import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/features/search/presention/widgets/search_chip_icon.dart';
import 'package:route_smart/features/search/presention/widgets/search_chip_label.dart';

class SearchClearChip extends StatelessWidget {
  const SearchClearChip({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final contentColor = context.colors.textSecondary;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: context.colors.fieldBackground,
          border: Border.all(color: context.colors.stroke),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SearchChipIcon(icon: Icons.close, color: contentColor),
            const SizedBox(width: 6),
            SearchChipLabel(label: 'Clear', color: contentColor),
          ],
        ),
      ),
    );
  }
}
