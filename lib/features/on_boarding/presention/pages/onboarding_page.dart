import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/features/on_boarding/data/models/onboarding_viewmodel.dart';

import '../refators/onboarding_body.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingViewModel(),
      child: Scaffold(
        backgroundColor: context.colors.background,
        body: SafeArea(child: OnboardingBody()),
      ),
    );
  }
}
