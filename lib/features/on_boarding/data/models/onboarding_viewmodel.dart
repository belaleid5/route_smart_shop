import 'package:flutter/widgets.dart';
import 'package:route_smart/features/on_boarding/data/models/data_source/onboarding_data.dart';
import 'package:route_smart/features/on_boarding/data/models/onboarding_model.dart';


class OnboardingViewModel extends ChangeNotifier {
  OnboardingViewModel() {
    _pageController = PageController();
  }

  late final PageController _pageController;
  int _currentPage = 0;

  static const _animationDuration = Duration(milliseconds: 400);
  static const _animationCurve = Curves.easeInOutCubic;

  PageController get pageController => _pageController;

  List<OnboardingModel> get pages => OnboardingData.pages;

  int get currentPage => _currentPage;

  
  bool get isLastPage => _currentPage == pages.length - 1;

  void onPageChanged(int index) {
    _currentPage = index;
    notifyListeners();
  }

  void nextPage() {
    if (isLastPage) return;
    _pageController.nextPage(
      duration: _animationDuration,
      curve: _animationCurve,
    );
  }

  void skip() {
    _pageController.animateToPage(
      pages.length - 1,
      duration: _animationDuration,
      curve: _animationCurve,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
