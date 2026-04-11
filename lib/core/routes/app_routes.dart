import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/animations/custom_page_route.dart';
import 'package:route_smart/core/common/screens/empty_screen.dart';
import 'package:route_smart/core/common/screens/main_screen.dart';
import 'package:route_smart/core/di/di.dart';
import 'package:route_smart/core/routes/routes_names.dart';
import 'package:route_smart/features/auth_feature/presention/manger/forgot_password/forgot_password_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/reset_password/reset_password_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/sign_in/sign_in_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/sign_up/register_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/verfiy_code/verify_code_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/pages/forgot_passwod.dart';
import 'package:route_smart/features/auth_feature/presention/pages/register_page.dart';
import 'package:route_smart/features/auth_feature/presention/pages/reset_password_page.dart';
import 'package:route_smart/features/auth_feature/presention/pages/sign_in.dart';
import 'package:route_smart/features/auth_feature/presention/pages/verication_code_page.dart';
import 'package:route_smart/features/details/presention/widgets/product_details_page.dart';
import 'package:route_smart/features/home/presention/manger/brand/brands_bloc.dart';
import 'package:route_smart/features/home/presention/manger/brand/brands_event.dart';
import 'package:route_smart/features/home/presention/manger/categroy/categories_bloc.dart';
import 'package:route_smart/features/home/presention/manger/categroy/categories_event.dart';
import 'package:route_smart/features/home/presention/manger/product/product_bloc.dart';
import 'package:route_smart/features/home/presention/manger/product/product_event.dart';
import 'package:route_smart/features/home/presention/pages/home_screen.dart';
import 'package:route_smart/features/on_boarding/presention/pages/onboarding_page.dart';
import 'package:route_smart/features/search/presention/manger/search_bloc.dart';
import 'package:route_smart/features/search/presention/manger/search_event.dart';
import 'package:route_smart/features/search/presention/pages/search_screen.dart';
import 'package:route_smart/features/splash/presention/pages/splash_page.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_event.dart';
import 'package:route_smart/features/wishlist/presention/pages/wishlist_page.dart';

class AppRouter {
  // ✅ Singleton instance من WishlistBloc
  static final WishlistBloc _wishlistBloc = sl<WishlistBloc>();

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

      case AppRoutesNames.reset_password:
        return CustomPageRoute(
          settings: settings,
          page: BlocProvider(
            create: (context) => sl<ResetPasswordBloc>(),
            child: const ResetPasswordPage(),
          ),
        );

      // ✅ Wishlist Page - استخدام BlocProvider.value
      case AppRoutesNames.wishlist:
        return CustomPageRoute(
          settings: settings,
          page: BlocProvider.value(
            value: _wishlistBloc..add(const WishlistEvent.getWishlist()),
            child: const WishlistPage(),
          ),
        );

      // ✅ Search Page - إضافة WishlistBloc
      case AppRoutesNames.search:
        return CustomPageRoute(
          settings: settings,
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    sl<CategoriesBloc>()
                      ..add(const CategoriesEvent.getCategories()),
              ),
              BlocProvider(
                create: (context) =>
                    sl<BrandsBloc>()..add(const BrandsEvent.getBrands()),
              ),
              BlocProvider(
                create: (context) =>
                    sl<ProductsBloc>()..add(const ProductsEvent.getProducts()),
              ),
              BlocProvider(
                create: (context) =>
                    sl<SearchBloc>()..add(const SearchEvent.search()),
              ),
              // ✅ إضافة WishlistBloc للـ Search
              BlocProvider.value(
                value: _wishlistBloc..add(const WishlistEvent.getWishlist()),
              ),
            ],
            child: const SearchScreen(),
          ),
        );

      // ✅ Home Page - استخدام نفس الـ instance
      case AppRoutesNames.home:
        return CustomPageRoute(
          settings: settings,
          page: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => sl<CategoriesBloc>()),
              BlocProvider(create: (context) => sl<BrandsBloc>()),
              BlocProvider(
                create: (context) =>
                    sl<ProductsBloc>()..add(const ProductsEvent.getProducts()),
              ),
              // ✅ استخدام BlocProvider.value بدلاً من create
              BlocProvider.value(
                value: _wishlistBloc..add(const WishlistEvent.getWishlist()),
              ),
            ],
            child: const HomeScreen(),
          ),
        );

      case AppRoutesNames.mainScreen:
        return CustomPageRoute(
          settings: settings,
          page: BlocProvider.value(
            value: _wishlistBloc..add(const WishlistEvent.getWishlist()),
            child: const MainScreen(),
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