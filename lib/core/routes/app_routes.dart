import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/domain/entites/product_entity.dart';
import 'package:route_smart/core/common/screens/empty_screen.dart';
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
import 'package:route_smart/features/cart/domain/entites/checkout_args.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/category_details/presention/manger/category_details_cubit.dart';
import 'package:route_smart/features/category_details/presention/manger/category_details_event.dart';
import 'package:route_smart/features/category_details/presention/pages/category_details_page.dart';
import 'package:route_smart/features/checkout/presention/manger/checkout_bloc.dart';
import 'package:route_smart/features/checkout/presention/pages/checkout_page.dart';
import 'package:route_smart/features/details/presention/manger/product_details_bloc.dart';
import 'package:route_smart/features/details/presention/manger/product_details_event.dart';
import 'package:route_smart/features/details/presention/page/product_details_page.dart';
import 'package:route_smart/features/home/presention/manger/brand/brands_bloc.dart';
import 'package:route_smart/features/home/presention/manger/categroy/categories_bloc.dart';
import 'package:route_smart/features/home/presention/manger/product/product_bloc.dart';
import 'package:route_smart/features/home/presention/pages/all_brands_page.dart';
import 'package:route_smart/features/home/presention/pages/all_categories_page.dart';
import 'package:route_smart/features/home/presention/pages/filter_categories_page.dart';
import 'package:route_smart/features/main/presention/pages/main_screen.dart';
import 'package:route_smart/features/profile/presention/manger/profile_bloc.dart';
import 'package:route_smart/features/profile/presention/pages/profile_page.dart';
import 'package:route_smart/features/reviews/presention/manger/review_events.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_bloc.dart';
import 'package:route_smart/features/reviews/presention/pages/reviews_page.dart';
import 'package:route_smart/features/search/presention/manger/search_bloc.dart';
import 'package:route_smart/features/search/presention/refactors/filtred_body.dart';
import 'package:route_smart/features/splash/presention/pages/splash_page.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesNames.emptyScreen:
        return _buildRoute(settings, const EmptyScreen());

      case AppRoutesNames.splashPage:
        return _buildRoute(settings, const SplashPage());

      case AppRoutesNames.signIn:
        return _buildRoute(
          settings,
          BlocProvider(
            create: (_) => sl<SignInBloc>(),
            child: const SignInPage(),
          ),
        );

      case AppRoutesNames.register:
        return _buildRoute(
          settings,
          BlocProvider(
            create: (_) => sl<RegisterBloc>(),
            child: const RegisterPage(),
          ),
        );

      case AppRoutesNames.forgotPassword:
        return _buildRoute(
          settings,
          BlocProvider(
            create: (_) => sl<ForgotPasswordBloc>(),
            child: const ForgotPasswordPage(),
          ),
        );

      case AppRoutesNames.verifyCode:
        return _buildRoute(
          settings,
          BlocProvider(
            create: (_) => sl<VerifyCodeBloc>(),
            child: const VerifyCodePage(),
          ),
        );

      case AppRoutesNames.reset_password:
        return _buildRoute(
          settings,
          BlocProvider(
            create: (_) => sl<ResetPasswordBloc>(),
            child: const ResetPasswordPage(),
          ),
        );

      case AppRoutesNames.profile:
        return _buildRoute(
          settings,
          BlocProvider.value(
            value: sl<ProfileBloc>(),
            child: const ProfilePage(),
          ),
        );

      case AppRoutesNames.mainScreen:
        return _buildRoute(settings, const MainScreen());

      case AppRoutesNames.allCategories:
        return _buildRoute(
          settings,
          MultiBlocProvider(
            providers: [
              BlocProvider.value(value: sl<CategoriesBloc>()),
              BlocProvider.value(value: sl<WishlistBloc>()),
              BlocProvider.value(value: sl<CartBloc>()),
            ],
            child: const AllCategoriesPage(),
          ),
        );

      case AppRoutesNames.allBrands:
        return _buildRoute(
          settings,
          MultiBlocProvider(
            providers: [
              BlocProvider.value(value: sl<BrandsBloc>()),
              BlocProvider.value(value: sl<WishlistBloc>()),
              BlocProvider.value(value: sl<CartBloc>()),
            ],
            child: const AllBrandsPage(),
          ),
        );

      case AppRoutesNames.categoryDetails:
        {
          final args = settings.arguments as Map<String, dynamic>?;
          final categoryId = args?['categoryId'] as String?;
          final categoryName = args?['categoryName'] as String?;

          if (categoryId == null || categoryName == null) {
            return _errorRoute('Missing category data');
          }

          return _buildRoute(
            settings,
            MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => sl<CategoryDetailsBloc>()
                    ..add(FetchSubcategoriesEvent(categoryId: categoryId)),
                ),
                BlocProvider.value(value: sl<WishlistBloc>()),
                BlocProvider.value(value: sl<CartBloc>()),
              ],
              child: CategoryDetailsPage(categoryName: categoryName),
            ),
          );
        }

      case AppRoutesNames.productDetails:
        {
          final product = settings.arguments as ProductEntity?;
          if (product == null) return _errorRoute('Missing product data');

          return _buildRoute(
            settings,
            MultiBlocProvider(
              providers: [
                BlocProvider.value(value: sl<WishlistBloc>()),
                BlocProvider.value(value: sl<CartBloc>()),
                BlocProvider(
                  create: (_) => sl<ProductDetailsBloc>()
                    ..add(ProductDetailsRequested(product.id)),
                ),
                BlocProvider(
                  create: (_) => sl<ReviewsBloc>()
                    ..add(ProductReviewsRequested(product.id)),
                ),
              ],
              child: ProductDetailsPage(product: product),
            ),
          );
        }

      case AppRoutesNames.checkout:
        {
          final args = settings.arguments as CheckoutRouteArgs?;
          if (args == null) return _errorRoute('Missing checkout arguments');

          return _buildRoute(
            settings,
            MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => sl<CheckoutBloc>()),
                BlocProvider.value(value: sl<CartBloc>()),
              ],
              child: CheckoutPage(
                cartId: args.cartId,
                cartItems: args.cartItems,
                totalPrice: args.totalPrice,
                customerEmail: '',
              ),
            ),
          );
        }

      case AppRoutesNames.reviews:
        {
          final productId = settings.arguments as String?;
          if (productId == null) return _errorRoute('Missing product ID');

          return _buildRoute(
            settings,
            BlocProvider(
              create: (_) => sl<ReviewsBloc>()
                ..add(ProductReviewsRequested(productId)),
              child: ReviewsPage(productId: productId),
            ),
          );
        }

      case AppRoutesNames.filteredProducts:
        {
          final args = settings.arguments as Map<String, dynamic>?;
          if (args == null) return _errorRoute('Missing filter arguments');

          return _buildRoute(
            settings,
            MultiBlocProvider(
              providers: [
                BlocProvider.value(value: sl<ProductsBloc>()),
                BlocProvider.value(value: sl<SearchBloc>()),
                BlocProvider.value(value: sl<WishlistBloc>()),
                BlocProvider.value(value: sl<CartBloc>()),
              ],
              child: FilterCategoriesPage(
                title: args['title'] as String? ?? '',
                categoryId: args['categoryId'] as String?,
                brandId: args['brandId'] as String?,
              ),
            ),
          );
        }

      default:
        return _errorRoute('Page not found: ${settings.name}');
    }
  }

  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget page) {
    return MaterialPageRoute(settings: settings, builder: (_) => page);
  }

  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.red, fontSize: 6),
          ),
        ),
      ),
    );
  }
}
