import 'package:dio/dio.dart';
import 'package:route_smart/core/constants/api_errors_constants.dart';
import 'package:route_smart/core/errors/api_error_model.dart';

enum DataSource {
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT,
}

class ResponseCode {
  static const int SUCCESS = 200;
  static const int NO_CONTENT = 201;
  static const int BAD_REQUEST = 400;
  static const int UNAUTORISED = 401;
  static const int FORBIDDEN = 403;
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int NOT_FOUND = 404;
  static const int API_LOGIC_ERROR = 422;

  // local status codes
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static final String NO_CONTENT = ApiErrorsConstants.noContent;
  static final String BAD_REQUEST = ApiErrorsConstants.badRequestError;
  static final String UNAUTORISED = ApiErrorsConstants.unauthorizedError;
  static final String FORBIDDEN = ApiErrorsConstants.forbiddenError;
  static final String INTERNAL_SERVER_ERROR =
      ApiErrorsConstants.internalServerError;
  static final String NOT_FOUND = ApiErrorsConstants.notFoundError;

  static final String CONNECT_TIMEOUT = ApiErrorsConstants.timeoutError;
  static final String CANCEL = ApiErrorsConstants.defaultError;
  static final String RECIEVE_TIMEOUT = ApiErrorsConstants.timeoutError;
  static final String SEND_TIMEOUT = ApiErrorsConstants.timeoutError;
  static final String CACHE_ERROR = ApiErrorsConstants.cacheError;
  static final String NO_INTERNET_CONNECTION =
      ApiErrorsConstants.noInternetError;
  static final String DEFAULT = ApiErrorsConstants.defaultError;
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    switch (this) {
      case DataSource.NO_CONTENT:
        return ApiErrorModel(
          code: ResponseCode.NO_CONTENT,
          message: ResponseMessage.NO_CONTENT,
        );
      case DataSource.BAD_REQUEST:
        return ApiErrorModel(
          code: ResponseCode.BAD_REQUEST,
          message: ResponseMessage.BAD_REQUEST,
        );
      case DataSource.FORBIDDEN:
        return ApiErrorModel(
          code: ResponseCode.FORBIDDEN,
          message: ResponseMessage.FORBIDDEN,
        );
      case DataSource.UNAUTORISED:
        return ApiErrorModel(
          code: ResponseCode.UNAUTORISED,
          message: ResponseMessage.UNAUTORISED,
        );
      case DataSource.NOT_FOUND:
        return ApiErrorModel(
          code: ResponseCode.NOT_FOUND,
          message: ResponseMessage.NOT_FOUND,
        );
      case DataSource.INTERNAL_SERVER_ERROR:
        return ApiErrorModel(
          code: ResponseCode.INTERNAL_SERVER_ERROR,
          message: ResponseMessage.INTERNAL_SERVER_ERROR,
        );
      case DataSource.CONNECT_TIMEOUT:
        return ApiErrorModel(
          code: ResponseCode.CONNECT_TIMEOUT,
          message: ResponseMessage.CONNECT_TIMEOUT,
        );
      case DataSource.CANCEL:
        return ApiErrorModel(
          code: ResponseCode.CANCEL,
          message: ResponseMessage.CANCEL,
        );
      case DataSource.RECIEVE_TIMEOUT:
        return ApiErrorModel(
          code: ResponseCode.RECIEVE_TIMEOUT,
          message: ResponseMessage.RECIEVE_TIMEOUT,
        );
      case DataSource.SEND_TIMEOUT:
        return ApiErrorModel(
          code: ResponseCode.SEND_TIMEOUT,
          message: ResponseMessage.SEND_TIMEOUT,
        );
      case DataSource.CACHE_ERROR:
        return ApiErrorModel(
          code: ResponseCode.CACHE_ERROR,
          message: ResponseMessage.CACHE_ERROR,
        );
      case DataSource.NO_INTERNET_CONNECTION:
        return ApiErrorModel(
          code: ResponseCode.NO_INTERNET_CONNECTION,
          message: ResponseMessage.NO_INTERNET_CONNECTION,
        );
      case DataSource.DEFAULT:
        return ApiErrorModel(
          code: ResponseCode.DEFAULT,
          message: ResponseMessage.DEFAULT,
        );
    }
  }
}

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      apiErrorModel = _handleError(error);
    } else {
      apiErrorModel = DataSource.DEFAULT.getFailure();
    }
  }
}

ApiErrorModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();

    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();

    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();

    case DioExceptionType.badResponse:
      final statusCode = error.response?.statusCode;

      // أخطاء السيرفر الداخلية - لا تسرب تفاصيل تقنية
      if (statusCode != null && statusCode >= 500) {
        return DataSource.INTERNAL_SERVER_ERROR.getFailure();
      }

      // أخطاء عدم التفويض
      if (statusCode == 401) {
        return DataSource.UNAUTORISED.getFailure();
      }

      // أخطاء عدم الوصول
      if (statusCode == 403) {
        return DataSource.FORBIDDEN.getFailure();
      }

      // أخطاء عدم وجود المورد
      if (statusCode == 404) {
        return DataSource.NOT_FOUND.getFailure();
      }

      // للحالات الأخرى (400, 422) حاول قراءة الـ body
      if (error.response?.data != null) {
        try {
          final model = ApiErrorModel.fromJson(
            error.response!.data as Map<String, dynamic>,
          );
          // تأكد أن الـ message ليست null أو فارغة
          if (model.message != null && model.message!.isNotEmpty) {
            return model;
          }
        } catch (_) {
          // ignore parsing errors
        }
      }
      return DataSource.DEFAULT.getFailure();

    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();

    case DioExceptionType.connectionError:
      return DataSource.NO_INTERNET_CONNECTION.getFailure();

    case DioExceptionType.badCertificate:
      return DataSource.DEFAULT.getFailure();

    case DioExceptionType.unknown:
      return DataSource.NO_INTERNET_CONNECTION.getFailure();
  }
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}