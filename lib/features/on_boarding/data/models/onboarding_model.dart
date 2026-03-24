import 'package:flutter/material.dart';

@immutable
class OnboardingModel {
  const OnboardingModel({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.badges,
  });

  final String title;
  final String description;

  final String imagePath;

  final List<OnboardingBadge> badges;
}






@immutable
class OnboardingBadge {
  const OnboardingBadge({
    required this.label,
    required this.icon,
    required this.isDark,
    required this.alignment,
  });

  final String label;
  final IconData icon;
  final bool isDark;

  final Alignment alignment;
}
