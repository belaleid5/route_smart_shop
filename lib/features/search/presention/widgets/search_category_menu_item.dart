import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';

class SearchCategoryMenuItem extends StatelessWidget {
  const SearchCategoryMenuItem({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.icon, // ✅ optional
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected
              ? context.color.primary.withValues(alpha: 0.08)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            // ── Leading Icon Circle ──────────────────────────────────────
            if (icon != null)
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? context.color.primary.withValues(alpha: 0.12)
                      : context.color.stroke.withValues(alpha: 0.5),
                ),
                child: Icon(
                  icon,
                  size: 14,
                  color: isSelected
                      ? context.color.primary
                      : context.color.textPrimary.withValues(alpha: 0.5),
                ),
              ),

            if (icon != null) const SizedBox(width: 10),

            // ── Label ────────────────────────────────────────────────────
            Expanded(
              child: Text(
                label,
                style: context.textStyle.copyWith(
                  fontSize: 13.5,
                  fontWeight: isSelected
                      ? FontWeightHelper.semiBold
                      : FontWeightHelper.medium,
                  color: isSelected
                      ? context.color.primary
                      : context.color.textPrimary,
                ),
              ),
            ),

            // ── Check Icon (Animated) ────────────────────────────────────
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
                      size: 18,
                    )
                  : const SizedBox(
                      key: ValueKey('empty'),
                      width: 18,
                      height: 18,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}