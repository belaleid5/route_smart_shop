import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

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
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: hasActiveFilters
              ? context.color.primary.withValues(alpha: 0.1)
              : Colors.transparent,
          border: Border.all(
            color: hasActiveFilters
                ? context.color.primary
                : context.color.stroke,
            width: hasActiveFilters ? 1.5 : 1,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.tune_rounded,
              size: 20,
              color: hasActiveFilters
                  ? context.color.primary
                  : context.color.textPrimary.withValues(alpha: 0.6),
            ),

            if (hasActiveFilters)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.color.primary,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}