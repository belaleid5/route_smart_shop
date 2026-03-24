import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/features/on_boarding/data/models/onboarding_model.dart';

import 'onboarding_floating_badge.dart';

/// Displays the page illustration inside a rounded card with floating badges.
class OnboardingImageCard extends StatelessWidget {
  const OnboardingImageCard({
    super.key,
    required this.imagePath,
    required this.badges,
  });

  final String imagePath;
  final List<OnboardingBadge> badges;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFFE8ECF4),
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 24,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: SvgPicture.asset(
              imagePath,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => const _ShoppingBagPlaceholder(),
            ),
          ).animateScaleNFadeHorizontal(
            duration: const Duration(milliseconds: 700),
          ),
          ...badges.map(
            (badge) => OnboardingFloatingBadge(badge: badge),
          ),
        ],
      ),
    );
  }
}

class _ShoppingBagPlaceholder extends StatelessWidget {
  const _ShoppingBagPlaceholder();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: 340,
      child: CustomPaint(painter: _ShoppingBagPainter()),
    );
  }
}

class _ShoppingBagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF3D5AF1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final cx = size.width / 2;
    final cy = size.height / 2;

    canvas
      ..drawPath(
        Path()
          ..moveTo(cx - 55, cy - 20)
          ..lineTo(cx - 65, cy + 60)
          ..lineTo(cx + 65, cy + 60)
          ..lineTo(cx + 55, cy - 20)
          ..close(),
        paint,
      )
      ..drawPath(
        Path()
          ..moveTo(cx - 25, cy - 20)
          ..cubicTo(cx - 25, cy - 65, cx + 25, cy - 65, cx + 25, cy - 20),
        paint,
      );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
