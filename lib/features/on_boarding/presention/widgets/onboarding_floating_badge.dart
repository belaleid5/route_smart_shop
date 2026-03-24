import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/features/on_boarding/data/models/onboarding_model.dart';

class OnboardingFloatingBadge extends StatelessWidget {
  const OnboardingFloatingBadge({super.key, required this.badge});

  final OnboardingBadge badge;

  bool get _isTopRight => badge.alignment == Alignment.topRight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _isTopRight ? 32 : null,
      right: _isTopRight ? 24 : null,
      left: _isTopRight ? null : 16,
      bottom: _isTopRight ? null : 80,
      child: Semantics(
        label: badge.label,
        child: _BadgeChip(badge: badge)
            .animateRightLeft(
              duration: const Duration(milliseconds: 600),
              isFromStart: !_isTopRight,
            )
            .animateShimmer(duration: const Duration(milliseconds: 2000)),
      ),
    );
  }
}

class _BadgeChip extends StatelessWidget {
  const _BadgeChip({required this.badge});

  final OnboardingBadge badge;

  static const _darkBackground = Color(0xFF1A1F6E);
  static const _lightIconColor = Color(0xFFB5451B);
  static const _darkTextColor = Color(0xFF0D0D0D);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = badge.isDark ? _darkBackground : Colors.white;
    final contentColor = badge.isDark ? Colors.white : _darkTextColor;
    final iconColor = badge.isDark ? Colors.white : _lightIconColor;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F000000),
            blurRadius: 16,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(badge.icon, size: 16, color: iconColor),
            const SizedBox(width: 6),
            Text(
              badge.label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.0,
                color: contentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
