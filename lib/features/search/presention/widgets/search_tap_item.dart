import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/search/presention/widgets/search_tab_badge.dart';
import 'package:route_smart/features/search/presention/widgets/search_tab_label.dart';

class SearchTabItem extends StatelessWidget {
  const SearchTabItem({
    super.key,
    required this.label,
    required this.count,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final int count;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final chipColor = isActive
        ? context.color.primary
        : context.color.fieldBackground;

    final borderColor = isActive ? context.color.primary : context.color.stroke;

    final labelColor = isActive
        ? context.color.white
        : context.color.textSecondary;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: chipColor,
          border: Border.all(color: borderColor),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SearchTabLabel(label: label, color: labelColor),
            const SizedBox(width: 6),
            SearchTabBadge(count: count, isActive: isActive),
          ],
        ),
      ),
    );
  }
}
