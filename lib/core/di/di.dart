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
import 'package:route_smart/features/home/presention/manger/brand/brands_bloc.dart';
import 'package:route_smart/features/home/presention/manger/categroy/categories_bloc.dart';
import 'package:route_smart/features/home/presention/manger/product/product_bloc.dart';
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

//home

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

//wishlist

Future<void> _iniWishlist() async {
  sl.registerLazySingleton<WishlistRemoteDataSource>(
    () => WishlistRemoteDataSourceImpl(sl<ApiService>(), sl()),
  );

  sl.registerLazySingleton<WishlistRepository>(() => WishlistRepository(sl()));

  sl.registerFactory(() => WishlistBloc(sl()));
}

void _registerCartFeature() {
  // DataSource
  sl.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(sl<ApiService>(), sl<SecureStorage>()),
  );

  // Repository
  sl.registerLazySingleton<CartRepositoryImpl>(
    () => CartRepositoryImpl(sl<CartRemoteDataSource>()),
  );

  // Cubit
  sl.registerFactory(() => CartBloc(sl<CartRepositoryImpl>()));
}
