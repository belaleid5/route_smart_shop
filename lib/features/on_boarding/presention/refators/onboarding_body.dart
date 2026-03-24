import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/features/on_boarding/data/models/onboarding_viewmodel.dart';
import 'package:route_smart/features/on_boarding/presention/refators/onboarding_page_content.dart';
import 'package:route_smart/features/on_boarding/presention/widgets/onboarding_dots_indicator.dart';
import 'package:route_smart/features/on_boarding/presention/widgets/onboarding_next_button.dart';
import 'package:route_smart/features/on_boarding/presention/widgets/onboarding_top_bar.dart';


class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key});

  static const _horizontalPadding = EdgeInsets.symmetric(horizontal: 24);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<OnboardingViewModel>();

    return Column(
      children: [
        const OnboardingTopBar(),
        Expanded(
          child: PageView.builder(
            controller: viewModel.pageController,
            onPageChanged: viewModel.onPageChanged,
            itemCount: viewModel.pages.length,
            itemBuilder: (_, index) => OnboardingPageContent(
              page: viewModel.pages[index],
            ),
          ),
        ),
        OnboardingDotsIndicator(
          count: viewModel.pages.length,
          currentIndex: viewModel.currentPage,
        ),
        const SizedBox(height: 24),
        Padding(
          padding: _horizontalPadding,
          child: OnboardingNextButton(
            isLastPage: viewModel.isLastPage,
            onTap: viewModel.isLastPage
                ? () => _onFinish(context)
                : viewModel.nextPage,
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  void _onFinish(BuildContext context) {
    // context.go(AppRoutes.home);
  }
}
