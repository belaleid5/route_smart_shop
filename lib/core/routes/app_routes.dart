import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/animations/custom_page_route.dart';
import 'package:route_smart/core/common/screens/empty_screen.dart';
import 'package:route_smart/core/di/di.dart';
import 'package:route_smart/core/routes/routes_names.dart';
import 'package:route_smart/features/auth_feature/data/repo/auth_repo.dart';
import 'package:route_smart/features/auth_feature/presention/manger/register_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/pages/register_page.dart';
import 'package:route_smart/features/on_boarding/presention/pages/onboarding_page.dart';
import 'package:route_smart/features/splash/presention/pages/splash_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesNames.emptyScreen:
        return CustomPageRoute(settings: settings, page: const EmptyScreen());

      case AppRoutesNames.splashPage:
        return CustomPageRoute(settings: settings, page: const SplashPage());

      case AppRoutesNames.onBoarding:
        return CustomPageRoute(
          settings: settings,
          page: const OnboardingPage(),
        );

    case AppRoutesNames.register:
        return CustomPageRoute(
          settings: settings,
          page: BlocProvider(
          create: (context) => sl<RegisterBloc>(),
          child: const RegisterPage(),
          ),
        );
      default:
        return CustomPageRoute(
          settings: settings,
          page: Scaffold(
            body: Center(child: Text('Page not found: ${settings.name}')),
          ),
        );
    }
  }
}
