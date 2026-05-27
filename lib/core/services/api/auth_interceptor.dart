import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:route_smart/core/helper/navigator_key.dart';
import 'package:route_smart/core/routes/routes_names.dart';
import 'package:route_smart/core/services/flutter_secure.dart';
import 'package:route_smart/core/services/shared_pref/shared_keys.dart';

class AuthInterceptor extends Interceptor {
  const AuthInterceptor(this._storage);

  final SecureStorage _storage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.read(PrefKeys.accessToken);

    if (token != null && token.isNotEmpty) {
      options.headers['token'] = token;
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      await _storage.delete(PrefKeys.accessToken);

      final context = navigatorKey.currentContext;
      if (context != null && context.mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutesNames.signIn,
          (route) => false,
        );
      }
    }

    handler.next(err);
  }
}