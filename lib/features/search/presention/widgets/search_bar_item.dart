import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';

class SearchFilterBarItem extends StatelessWidget {
  const SearchFilterBarItem({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    this.badgeCount,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  final int? badgeCount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutCubic,
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isSelected
              ? context.color.primary
              : context.color.white,
          border: Border.all(
            color: isSelected
                ? context.color.primary
                : context.color.stroke,
            width: isSelected ? 1.5 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: context.color.primary.withValues(alpha: 0.25),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Icon ──────────────────────────────────────────────────────
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  icon,
                  size: 18,
                  color: isSelected
                      ? context.color.white
                      : context.color.primary,
                ),

                // ── Badge ────────────────────────────────────────────────
                if (badgeCount != null && badgeCount! > 0)
                  Positioned(
                    top: -6,
                    right: -6,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected
                            ? context.color.white
                            : context.color.primary,
                      ),
                      child: Text(
                        '$badgeCount',
                        style: context.textStyle.copyWith(
                          fontSize: 9,
                          fontWeight: FontWeightHelper.bold,
                          color: isSelected
                              ? context.color.primary
                              : context.color.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(width: 8),

            // ── Label ─────────────────────────────────────────────────────
            Text(
              label,
              style: context.textStyle.copyWith(
                fontSize: 13,
                fontWeight: isSelected
                    ? FontWeightHelper.semiBold
                    : FontWeightHelper.medium,
                color: isSelected
                    ? context.color.white
                    : context.color.textPrimary,
                letterSpacing: -0.1,
              ),
            ),

            // ── Arrow (فقط للـ category) ──────────────────────────────────
            if (badgeCount == null) ...[
              const SizedBox(width: 4),
              AnimatedRotation(
                turns: isSelected ? 0.5 : 0,
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOutCubic,
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 16,
                  color: isSelected
                      ? context.color.white
                      : context.color.textPrimary,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}