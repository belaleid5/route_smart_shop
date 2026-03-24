import 'package:flutter/material.dart';

class OnboardingDotsIndicator extends StatelessWidget {
  const OnboardingDotsIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  final int count;

  final int currentIndex;

  static const _activeDotColor = Color(0xFF3D5AF1);
  static const _inactiveDotColor = Color(0xFFCDD0DA);
  static const _activeDotWidth = 28.0;
  static const _dotSize = 8.0;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Page ${currentIndex + 1} of $count',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(count, _buildDot),
      ),
    );
  }

  Widget _buildDot(int index) {
    final isActive = index == currentIndex;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCubic,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? _activeDotWidth : _dotSize,
      height: _dotSize,
      decoration: BoxDecoration(
        color: isActive ? _activeDotColor : _inactiveDotColor,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
