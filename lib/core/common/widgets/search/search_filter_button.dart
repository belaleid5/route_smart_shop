import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class SearchFilterButton extends StatelessWidget {
  const SearchFilterButton({
    super.key,
    required this.hasActiveFilters,
    required this.onTap,
  });

  final bool hasActiveFilters;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final iconColor = hasActiveFilters
        ? context.colors.primary
        : context.colors.icon;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: hasActiveFilters
              ? context.colors.primary.withValues(alpha: 0.1)
              : context.colors.white,
          border: Border.all(
            color: hasActiveFilters
                ? context.colors.primary
                : context.colors.stroke,
            width: hasActiveFilters ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: hasActiveFilters
                  ? context.colors.primary.withValues(alpha: 0.25)
                  : Colors.black.withValues(alpha: 0.06),
              blurRadius: hasActiveFilters ? 10 : 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.tune_rounded, size: 20, color: iconColor),
            if (hasActiveFilters)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.colors.primary,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
