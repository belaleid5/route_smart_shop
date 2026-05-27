import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:route_smart/core/constants/api_constants.dart';
import 'package:route_smart/core/helper/navigator_key.dart';
import 'package:route_smart/core/routes/routes_names.dart';
import 'package:route_smart/core/services/flutter_secure.dart';
import 'package:route_smart/core/services/shared_pref/shared_keys.dart';

class DioFactory {
  DioFactory._();

  static Dio? _instance;

  static Dio get instance {
    _instance ??= _createDio();
    return _instance!;
  }

  static Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectionTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _addInterceptors(dio);
    return dio;
  }

  static void _addInterceptors(Dio dio) {
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          error: true,
        ),
      );
    }

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final isPublic = _isPublicRoute(options.path);

          if (!isPublic) {
            final token = await SecureStorage().read(PrefKeys.accessToken);

            if (token != null && token.isNotEmpty) {
              options.headers['token'] = token;
              debugPrint('Token added for: ${options.path}');
            } else {
              debugPrint('No token found for: ${options.path}');
            }
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            debugPrint('401 Unauthorized - Logging out');

            await SecureStorage().delete(PrefKeys.accessToken);
            await SecureStorage().delete(PrefKeys.userId);
            await SecureStorage().delete(PrefKeys.tokenExpiry);

            final context = navigatorKey.currentContext;
            if (context != null && context.mounted) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutesNames.signIn,
                (route) => false,
              );
            }
          }

          return handler.next(error);
        },
      ),
    );
  }

  static bool _isPublicRoute(String path) {
    const publicRoutes = [
      'auth/signup',
      'auth/signin',
      'auth/forgotPasswords',
      'auth/verifyResetCode',
      'auth/resetPassword',
    ];
    return publicRoutes.any((route) => path.contains(route));
  }
}