// core/services/api/dio_factory.dart

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:route_smart/core/constants/api_constants.dart';
import 'package:route_smart/core/services/flutter_secure.dart';
import 'package:route_smart/core/services/shared_pref/shared_keys.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    const timeOut = Duration(seconds: 30);

    if (dio == null) {
      dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          connectTimeout: timeOut,
          receiveTimeout: timeOut,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      _addInterceptors();
    }

    return dio!;
  }

  static void _addInterceptors() {
    // ── Logger ──────────────────────────────────
    dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );

    // ── Auth ────────────────────────────────────
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final isPublic = _isPublicRoute(options.path);

          if (!isPublic) {
            // ✅ await لأن SecureStorage async
            final token = await SecureStorage().getString(
              PrefKeys.accessToken,
            );

            if (token != null && token.isNotEmpty) {
              options.headers['token'] = token;
              debugPrint('✅ Token added: $token');
            } else {
              debugPrint('❌ No token found');
            }
          }

          return handler.next(options);
        },
        onError: (error, handler) {
          debugPrint('❌ Error: ${error.requestOptions.uri}');
          debugPrint('❌ Status: ${error.response?.statusCode}');
          return handler.next(error);
        },
      ),
    );
  }

  // ── Public routes (no token needed) ──────────
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