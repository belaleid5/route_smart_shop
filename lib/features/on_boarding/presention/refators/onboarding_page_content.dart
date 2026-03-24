import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/features/on_boarding/data/models/onboarding_model.dart';
import 'package:route_smart/features/on_boarding/presention/widgets/onboarding_image_card.dart';

class OnboardingPageContent extends StatelessWidget {
  const OnboardingPageContent({super.key, required this.page});

  final OnboardingModel page;

  static const _cardPadding = EdgeInsets.symmetric(horizontal: 24);
  static const _titlePadding = EdgeInsets.symmetric(horizontal: 32);
  static const _descriptionPadding = EdgeInsets.symmetric(horizontal: 40);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        const SizedBox(height: 16),
        Expanded(
          child: Padding(
            padding: _cardPadding,
            child: OnboardingImageCard(
              imagePath: page.imagePath,
              badges: page.badges,
            ),
          ),
        ),
        const SizedBox(height: 32),
        Padding(
          padding: _titlePadding,
          child: Text(
            page.title,
            textAlign: TextAlign.center,
            style: textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w900,
              height: 1.15,
              letterSpacing: -0.5,
              color: colorScheme.onSurface,
            ),
          ).animateBottomToTop(
            duration: const Duration(milliseconds: 500),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: _descriptionPadding,
          child: Text(
            page.description,
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(
              height: 1.6,
              color: colorScheme.onSurfaceVariant,
            ),
          ).animateBlur(duration: const Duration(milliseconds: 600)),
        ),
        const SizedBox(height: 28),
      ],
    );
  }
}
