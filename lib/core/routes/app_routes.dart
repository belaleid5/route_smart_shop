import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/animations/custom_page_route.dart';
import 'package:route_smart/core/common/screens/empty_screen.dart';
import 'package:route_smart/core/di/di.dart';
import 'package:route_smart/core/routes/routes_names.dart';
import 'package:route_smart/features/auth_feature/presention/manger/forgot_password/forgot_password_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/sign_in/sign_in_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/sign_up/register_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/verfiy_code/verify_code_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/pages/forgot_passwod.dart';
import 'package:route_smart/features/auth_feature/presention/pages/register_page.dart';
import 'package:route_smart/features/auth_feature/presention/pages/sign_in.dart';
import 'package:route_smart/features/auth_feature/presention/pages/verication_code_page.dart';
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


         case AppRoutesNames.signIn:
        return CustomPageRoute(
          settings: settings,
          page: BlocProvider(
          create: (context) => sl<SignInBloc>(),
          child: const SignInPage(),
          ),
        );


        case AppRoutesNames.forgotPassword:
        return CustomPageRoute(
          settings: settings,
          page: BlocProvider(
          create: (context) => sl<ForgotPasswordBloc>(),
          child: const ForgotPasswordPage(),
          ),
        );

 case AppRoutesNames.verifyCode:
        return CustomPageRoute(
          settings: settings,
          page: BlocProvider(
          create: (context) => sl<VerifyCodeBloc>(),
          child: const VerifyCodePage(),
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
