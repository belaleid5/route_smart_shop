// core/routes/app_router.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/data/model/product_data_model.dart';
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
import 'package:route_smart/features/cart/data/models/cart_item_model.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/cart/presention/manger/cart_event.dart';
import 'package:route_smart/features/cart/presention/page/cart_page.dart';
import 'package:route_smart/features/checkout/data/models/shipping_address_model.dart';
import 'package:route_smart/features/checkout/presention/manger/checkout_bloc.dart';
import 'package:route_smart/features/checkout/presention/pages/checkout_page.dart';
import 'package:route_smart/features/checkout/presention/pages/payment_deatils_page.dart';
import 'package:route_smart/features/details/presention/manger/product_details_bloc.dart';
import 'package:route_smart/features/details/presention/manger/product_details_event.dart';
import 'package:route_smart/features/details/presention/page/product_details_page.dart';
import 'package:route_smart/features/home/presention/manger/brand/brands_bloc.dart';
import 'package:route_smart/features/home/presention/manger/brand/brands_event.dart';
import 'package:route_smart/features/home/presention/manger/categroy/categories_bloc.dart';
import 'package:route_smart/features/home/presention/manger/categroy/categories_event.dart';
import 'package:route_smart/features/home/presention/manger/product/product_bloc.dart';
import 'package:route_smart/features/home/presention/manger/product/product_event.dart';
import 'package:route_smart/features/home/presention/pages/home_screen.dart';
import 'package:route_smart/features/reviews/presention/manger/review_events.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_bloc.dart';
import 'package:route_smart/features/reviews/presention/pages/reviews_page.dart';
import 'package:route_smart/features/search/presention/manger/search_bloc.dart';
import 'package:route_smart/features/search/presention/manger/search_event.dart';
import 'package:route_smart/features/search/presention/pages/search_screen.dart';
import 'package:route_smart/features/splash/presention/pages/splash_page.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_event.dart';
import 'package:route_smart/features/wishlist/presention/pages/wishlist_page.dart';

class AppRouter {
  static final WishlistBloc _wishlistBloc = sl<WishlistBloc>();
  static final CartBloc _cartBloc = sl<CartBloc>();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesNames.emptyScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const EmptyScreen(),
        );

      case AppRoutesNames.splashPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashPage(),
        );

      case AppRoutesNames.cart:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: _cartBloc..add(const CartEvent.getCart()),
            child: const CartPage(),
          ),
        );

      case AppRoutesNames.register:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => sl<RegisterBloc>(),
            child: const RegisterPage(),
          ),
        );

      case AppRoutesNames.signIn:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => sl<SignInBloc>(),
            child: const SignInPage(),
          ),
        );

      case AppRoutesNames.forgotPassword:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => sl<ForgotPasswordBloc>(),
            child: const ForgotPasswordPage(),
          ),
        );

      case AppRoutesNames.verifyCode:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => sl<VerifyCodeBloc>(),
            child: const VerifyCodePage(),
          ),
        );

      case AppRoutesNames.reset_password:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => sl<ResetPasswordBloc>(),
            child: const ResetPasswordPage(),
          ),
        );

      case AppRoutesNames.wishlist:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: _wishlistBloc..add(const WishlistEvent.getWishlist()),
            child: const WishlistPage(),
          ),
        );

      case AppRoutesNames.search:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => sl<CategoriesBloc>()
                  ..add(const CategoriesEvent.getCategories()),
              ),
              BlocProvider(
                create: (_) =>
                    sl<BrandsBloc>()..add(const BrandsEvent.getBrands()),
              ),
              BlocProvider(
                create: (_) => sl<ProductsBloc>()
                  ..add(const ProductsEvent.getProducts()),
              ),
              BlocProvider(
                create: (_) =>
                    sl<SearchBloc>()..add(const SearchEventSearch()),
              ),
              BlocProvider.value(value: _wishlistBloc),
              BlocProvider.value(value: _cartBloc),
            ],
            child: const SearchScreen(showBackButton: true),
          ),
        );

      case AppRoutesNames.home:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => sl<CategoriesBloc>()),
              BlocProvider(create: (_) => sl<BrandsBloc>()),
              BlocProvider(
                create: (_) => sl<ProductsBloc>()
                  ..add(const ProductsEvent.getProducts()),
              ),
              BlocProvider.value(value: _wishlistBloc),
              BlocProvider.value(value: _cartBloc),
            ],
            child: const HomeScreen(),
          ),
        );

      case AppRoutesNames.mainScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: _wishlistBloc
                  ..add(const WishlistEvent.getWishlist()),
              ),
              BlocProvider.value(
                value: _cartBloc..add(const CartEvent.getCart()),
              ),
            ],
            child: const MainScreen(),
          ),
        );

   
      case AppRoutesNames.checkout:
        final args = settings.arguments as Map<String, dynamic>?;
        if (args == null) {
          return _errorRoute('Missing checkout arguments');
        }
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => sl<CheckoutBloc>()),
              BlocProvider.value(value: _cartBloc),
            ],
            child: CheckoutPage(
              cartId: args['cartId'] as String,
              cartItems: args['cartItems'] as List<CartItemModel>,
              totalPrice: args['totalPrice'] as double,
            ),
          ),
        );

case AppRoutesNames.reviews:
  final productId = settings.arguments as String?;
  if (productId == null) {
    return _errorRoute('Missing product ID for reviews');
  }
  return MaterialPageRoute(
    settings: settings,
    builder: (_) => BlocProvider(
      create: (_) => sl<ReviewsBloc>()
        ..add(ReviewsEvent.getProductReviews(productId: productId)),
      child: ReviewsPage(productId: productId),
    ),
  );

  case AppRoutesNames.productDetails:
    final product = settings.arguments as ProductDataModel?;
    if (product == null) {
      return _errorRoute('Missing product data');
    }
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _wishlistBloc),
          BlocProvider.value(value: _cartBloc),
          BlocProvider(
            create: (_) => sl<ProductDetailsBloc>()
              ..add(ProductDetailsEvent.getProductDetails(product.id ?? '')),
          ),
          BlocProvider(
            create: (_) => sl<ReviewsBloc>()
              ..add(ReviewsEvent.getProductReviews(productId: product.id ?? '')),
          ),
        ],
        child: ProductDetailsPage(product: product),
      ),
    );

      case AppRoutesNames.paymentDetails:
        final args = settings.arguments as Map<String, dynamic>?;
        if (args == null) {
          return _errorRoute('Missing payment details arguments');
        }
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => sl<CheckoutBloc>(),
            child: PaymentDetailsPage(
              amount: args['amount'] as double,
              cartId: args['cartId'] as String,
              shippingAddress:
                  args['shippingAddress'] as ShippingAddressModel,
            ),
          ),
        );

      default:
        return _errorRoute('Page not found: ${settings.name}');
    }
  }

  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.red, fontSize: 16),
          ),
        ),
      ),
    );
  }
}