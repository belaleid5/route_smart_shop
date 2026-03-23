import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:route_smart/core/constants/api_constants.dart';
import 'package:route_smart/core/services/shared_pref/shared_keys.dart';
import 'package:route_smart/core/services/shared_pref/shared_pref.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    const timeOut = Duration(minutes: 2);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      debugPrint(
        "[USER Token] ====> ${SharedPref().getString(PrefKeys.accessToken) ?? 'NULL TOKEN'}",
      );

      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: false,
      ),
    );

    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // 🔥 قائمة الـ endpoints اللي متحتاجش token
          final publicEndpoints = [
            ApiConstants.loginEndpoint,
            '/api/auth/register/',
            '/api/auth/forgot-password/',
            '/api/auth/reset-password/',
          ];

          // ❌ لو الـ request في القائمة دي، متحطش token
          final isPublicEndpoint = publicEndpoints.any(
            (endpoint) => options.path.contains(endpoint),
          );

          if (isPublicEndpoint) {
            debugPrint('🚫 Public endpoint detected: ${options.path}');
            debugPrint('🚫 Skipping Authorization header');
            options.headers.remove('Authorization');
          } else {
            // ✅ لو مش public endpoint، حط الـ token
            final token = SharedPref().getString(PrefKeys.accessToken);

            if (token != null && token.isNotEmpty && token != 'null') {
              options.headers['Authorization'] = 'Bearer $token';
              debugPrint('✅ Authorization header added');
            } else {
              debugPrint('⚠️ No valid token found');
            }
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          debugPrint(
            '✅ Response: ${response.statusCode} - ${response.requestOptions.path}',
          );
          return handler.next(response);
        },
        onError: (error, handler) async {
          debugPrint(
            '❌ Error: ${error.response?.statusCode} - ${error.message}',
          );
          debugPrint('❌ Path: ${error.requestOptions.path}');

          if (error.response?.statusCode == 401) {
            // ❌ لو unauthorized ومش login request، اعمل logout
            final isLoginRequest = error.requestOptions.path.contains(
              ApiConstants.loginEndpoint,
            );

            if (!isLoginRequest) {
              debugPrint('🔴 Unauthorized - Logging out');
              // await AppLogout().logout();
            } else {
              debugPrint('⚠️ Login failed with 401');
            }
          }

          return handler.next(error);
        },
      ),
    );
  }

  // 🔄 Method لتحديث الـ Dio بعد Login
  static void updateToken(String newToken) {
    debugPrint('🔄 Token updated in DioFactory');
    // الـ Interceptor هياخد الـ token الجديد من SharedPrefs تلقائياً
  }

  // 🗑️ Method لمسح الـ Token
  static void clearToken() {
    debugPrint('🗑️ Token cleared from DioFactory');
  }
}
