// core/di/di.dart

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:route_smart/core/app/app_cubit/app_cubit_cubit.dart';
import 'package:route_smart/core/common/data/data_source/all_products_data_source.dart';
import 'package:route_smart/core/common/data/repo/all_data_products_repo.dart';
import 'package:route_smart/core/constants/api_constants.dart';
import 'package:route_smart/core/services/api/api_services.dart';
import 'package:route_smart/core/services/flutter_secure.dart';
import 'package:route_smart/features/auth_feature/data/data_source/auth_data_source.dart';
import 'package:route_smart/features/auth_feature/data/repo/auth_repo.dart';
import 'package:route_smart/features/auth_feature/presention/manger/forgot_password/forgot_password_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/reset_password/reset_password_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/sign_in/sign_in_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/sign_up/register_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/verfiy_code/verify_code_bloc.dart';
import 'package:route_smart/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:route_smart/features/cart/data/repo/cart_repo.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/checkout/data/data_source/checkout_remote_data_source.dart';
import 'package:route_smart/features/checkout/data/data_source/stripe_data_source.dart';
import 'package:route_smart/features/checkout/data/repo/checkout_repo.dart';
import 'package:route_smart/features/checkout/data/repo/stripe_repo.dart';
import 'package:route_smart/features/checkout/presention/manger/checkout_bloc.dart';
import 'package:route_smart/features/details/data/data_source/product_details_data_source.dart';
import 'package:route_smart/features/details/data/repo/product_details_repo.dart';
import 'package:route_smart/features/details/presention/manger/product_details_bloc.dart';
import 'package:route_smart/features/home/presention/manger/brand/brands_bloc.dart';
import 'package:route_smart/features/home/presention/manger/categroy/categories_bloc.dart';
import 'package:route_smart/features/home/presention/manger/product/product_bloc.dart';
import 'package:route_smart/features/reviews/data/data_source/reviews_remote_data_source.dart';
import 'package:route_smart/features/reviews/data/repo/reviews_repository_impl.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_bloc.dart';
import 'package:route_smart/features/search/presention/manger/search_bloc.dart';
import 'package:route_smart/features/wishlist/data/data_source/wishlist_data_source.dart';
import 'package:route_smart/features/wishlist/data/repo/wishlisrt_repo.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> setupDI() async {
  await _initCore();
  await _initAuth();
  await _initHome();
  await _iniWishlist();
  _registerCartFeature();
  _detailsProductFeature();
  _registerStripeFeature();
  _registerCheckoutFeature();
  _registerReviewsFeature(); 
}

Future<void> _initCore() async {
  sl.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectionTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
      ),
    )..interceptors.add(LogInterceptor(requestBody: true, responseBody: true)),
  );

  sl
    ..registerFactory(AppCubit.new)
    ..registerLazySingleton<ApiService>(() => ApiService(sl<Dio>()));
  sl.registerLazySingleton<SecureStorage>(() => SecureStorage());
}

Future<void> _initAuth() async {
  sl.registerLazySingleton<AuthRemoteDataSourceImpl>(
    () => AuthRemoteDataSourceImpl(sl<ApiService>()),
  );

  sl.registerLazySingleton<AuthRepositoryImpl>(
    () => AuthRepositoryImpl(sl<AuthRemoteDataSourceImpl>(), sl()),
  );

  sl.registerFactory(() => SignInBloc(sl<AuthRepositoryImpl>()));
  sl.registerFactory(() => RegisterBloc(sl<AuthRepositoryImpl>()));
  sl.registerFactory(() => ForgotPasswordBloc(sl<AuthRepositoryImpl>()));
  sl.registerFactory(() => VerifyCodeBloc(sl<AuthRepositoryImpl>()));
  sl.registerFactory(() => ResetPasswordBloc(sl<AuthRepositoryImpl>()));
}

Future<void> _initHome() async {
  sl.registerLazySingleton<AllDataProductsRemoteDataSource>(
    () => AllDataProductsRemoteDataSourceImpl(sl<ApiService>()),
  );

  sl.registerLazySingleton<AllDataProductsRepository>(
    () => AllDataProductsRepository(sl<AllDataProductsRemoteDataSource>()),
  );

  sl.registerFactory(() => CategoriesBloc(sl<AllDataProductsRepository>()));
  sl.registerFactory(() => BrandsBloc(sl<AllDataProductsRepository>()));
  sl.registerFactory(() => ProductsBloc(sl<AllDataProductsRepository>()));
  sl.registerFactory(() => SearchBloc(sl<AllDataProductsRepository>()));
}

Future<void> _iniWishlist() async {
  sl.registerLazySingleton<WishlistRemoteDataSource>(
    () => WishlistRemoteDataSourceImpl(sl<ApiService>(), sl()),
  );

  sl.registerLazySingleton<WishlistRepository>(() => WishlistRepository(sl()));

  sl.registerFactory(() => WishlistBloc(sl()));
}

void _registerCartFeature() {
  sl.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(sl<ApiService>(), sl<SecureStorage>()),
  );

  sl.registerLazySingleton<CartRepositoryImpl>(
    () => CartRepositoryImpl(sl<CartRemoteDataSource>()),
  );

  sl.registerFactory(() => CartBloc(sl<CartRepositoryImpl>()));
}

void _detailsProductFeature() {
  sl.registerLazySingleton<ProductDetailsRemoteDataSource>(
    () => ProductDetailsRemoteDataSourceImpl(sl<ApiService>()),
  );

  sl.registerLazySingleton<ProductDetailsRepository>(
    () => ProductDetailsRepository(sl()),
  );

  sl.registerFactory(() => ProductDetailsBloc(sl()));
}

void _registerStripeFeature() {
  sl.registerLazySingleton<StripeRemoteDataSource>(
    () => StripeRemoteDataSourceImpl(sl<ApiService>()),
  );
  sl.registerLazySingleton<StripeRepository>(
    () => StripeRepository(sl<StripeRemoteDataSource>()),
  );
}

void _registerCheckoutFeature() {
  sl.registerLazySingleton<CheckoutRemoteDataSource>(
    () => CheckoutRemoteDataSourceImpl(sl<ApiService>(), sl<SecureStorage>()),
  );

  sl.registerLazySingleton<CheckoutRepository>(
    () => CheckoutRepository(sl<CheckoutRemoteDataSource>()),
  );

  sl.registerFactory(
    () => CheckoutBloc(
      sl<CheckoutRepository>(),
      sl<StripeRepository>(),
    ),
  );
}

// ✅ Reviews Feature
void _registerReviewsFeature() {
  // Data Source
  sl.registerLazySingleton<ReviewsRemoteDataSource>(
    () => ReviewsRemoteDataSourceImpl(sl<ApiService>(), sl<SecureStorage>()),
  );

  // Repository
  sl.registerLazySingleton<ReviewsRepository>(
    () => ReviewsRepository(sl<ReviewsRemoteDataSource>()),
  );

  // Bloc
  sl.registerFactory(() => ReviewsBloc(sl<ReviewsRepository>()));
}