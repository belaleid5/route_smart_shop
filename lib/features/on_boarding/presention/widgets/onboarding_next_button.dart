import 'package:flutter/material.dart';

/// Primary CTA button for the onboarding flow.
///
/// Shows "Next →" on intermediate pages and "Get Started ✓" on the last page.
/// The icon transitions smoothly via [AnimatedSwitcher].
class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
    required this.isLastPage,
    required this.onTap,
  });

  final bool isLastPage;
  final VoidCallback onTap;

  static const _buttonHeight = 60.0;
  static const _borderRadius = 18.0;
  static const _backgroundColor = Color(0xFF3D5AF1);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: isLastPage ? 'Get Started' : 'Next page',
      child: SizedBox(
        width: double.infinity,
        height: _buttonHeight,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: _backgroundColor,
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_borderRadius),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isLastPage ? 'Get Started' : 'Next',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(width: 10),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  isLastPage
                      ? Icons.check_rounded
                      : Icons.arrow_forward_rounded,
                  key: ValueKey(isLastPage),
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
