import 'package:flutter/material.dart';
import 'package:route_smart/core/styles/app_images.dart';
import 'package:route_smart/features/on_boarding/data/models/onboarding_model.dart';

abstract final class OnboardingData {
  static const List<OnboardingModel> pages = [
    OnboardingModel(
      title: 'Discover Best\nProducts',
      description:
          'Explore our curated collection of\n'
          'top-tier products from brands you love.',
        imagePath: AppImages.shopIcon,
      badges: [
        OnboardingBadge(
          label: 'CURATED',
          icon: Icons.star_rounded,
          isDark: false,
          alignment: Alignment.topRight,
        ),
        OnboardingBadge(
          label: 'PREMIUM',
          icon: Icons.verified_rounded,
          isDark: true,
          alignment: Alignment.centerLeft,
        ),
      ],
    ),
    OnboardingModel(
      title: 'Fast & Secure\nDelivery',
      description:
          'Get your orders delivered quickly and\n'
          'safely right to your doorstep.',
        imagePath: AppImages.carContainer,
      badges: [
        OnboardingBadge(
          label: 'EXPRESS',
          icon: Icons.flash_on_rounded,
          isDark: false,
          alignment: Alignment.topRight,
        ),
        OnboardingBadge(
          label: 'TRACKED',
          icon: Icons.location_on_rounded,
          isDark: true,
          alignment: Alignment.centerLeft,
        ),
      ],
    ),
    OnboardingModel(
      title: 'Easy & Secure\nPayments',
      description:
          'Pay with confidence using our\n'
          'secure and seamless checkout.',
      imagePath: AppImages.orderConfirmIcon,
      badges: [
        OnboardingBadge(
          label: 'SECURE',
          icon: Icons.lock_rounded,
          isDark: false,
          alignment: Alignment.topRight,
        ),
        OnboardingBadge(
          label: 'INSTANT',
          icon: Icons.bolt_rounded,

          isDark: true,
          alignment: Alignment.centerLeft,
        ),
      ],
    ),
  ];
}
