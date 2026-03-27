import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:route_smart/core/app/app_cubit/app_cubit_cubit.dart';
import 'package:route_smart/core/constants/api_constants.dart';
import 'package:route_smart/core/services/api/api_services.dart';
import 'package:route_smart/features/auth_feature/data/data_source/auth_data_source.dart';
import 'package:route_smart/features/auth_feature/data/repo/auth_repo.dart';
import 'package:route_smart/features/auth_feature/presention/manger/forgot_password/forgot_password_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/sign_in/sign_in_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/sign_up/register_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/verfiy_code/verify_code_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> setupDI() async {
  await _initCore();
  await _initAuth();
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
}

Future<void> _initAuth() async {
  sl.registerLazySingleton<AuthRemoteDataSourceImpl>(
    () => AuthRemoteDataSourceImpl(sl<ApiService>()),
  );

  sl.registerLazySingleton<AuthRepositoryImpl>(
    () => AuthRepositoryImpl(sl<AuthRemoteDataSourceImpl>()),
  );

  sl.registerFactory(() => SignInBloc(sl<AuthRepositoryImpl>()));
  sl.registerFactory(() => RegisterBloc(sl<AuthRepositoryImpl>()));
  sl.registerFactory(() => ForgotPasswordBloc(sl<AuthRepositoryImpl>()));
  sl.registerFactory(() => VerifyCodeBloc(sl<AuthRepositoryImpl>()));

}
