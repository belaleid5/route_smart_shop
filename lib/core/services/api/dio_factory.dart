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
    const timeOut = Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.baseUrl = ApiConstants
            .baseUrl // 👈 أهم إضافة
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        };

      addDioInterceptor();
    }
    return dio!;
  }

  static void addDioInterceptor() {
    // 1. Logger Interceptor
    dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );

    // 2. Auth & Logic Interceptor
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // جلب التوكن - تأكد أن SharedPref جاهز
          final token = SharedPref().getString(PrefKeys.accessToken);

          // تحديد المسارات التي لا تحتاج توكن بدقة من الـ Constants
          final isPublic =
              options.path.contains('auth/signup') ||
              options.path.contains('auth/signin');

          if (!isPublic && token != null && token.isNotEmpty) {
            options.headers['token'] =
                token; // سيرفر Route غالباً يستخدم 'token' وليس 'Authorization'
          }

          return handler.next(options);
        },
        onError: (error, handler) {
          // تحويل الخطأ لرسالة مفهومة قبل تمريره للـ Repository
          debugPrint("❌ Full Path: ${error.requestOptions.uri}");
          return handler.next(error);
        },
      ),
    );
  }
}
