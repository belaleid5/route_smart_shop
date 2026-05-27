import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/core/services/flutter_secure.dart';
import 'package:route_smart/core/services/shared_pref/shared_keys.dart';
import 'package:route_smart/features/auth_feature/data/data_source/auth_data_source.dart';
import 'package:route_smart/features/auth_feature/data/models/auth_response_model.dart';
import 'package:route_smart/features/auth_feature/data/models/forgot_password/forgot_password_request_model.dart';
import 'package:route_smart/features/auth_feature/data/models/message_response_model.dart';
import 'package:route_smart/features/auth_feature/data/models/reset_password/reset_password_request_model.dart';
import 'package:route_smart/features/auth_feature/data/models/reset_password/reset_password_response.dart';
import 'package:route_smart/features/auth_feature/data/models/sign_in/sign_in_request_model.dart';
import 'package:route_smart/features/auth_feature/data/models/sign_up/register_request_model.dart';
import 'package:route_smart/features/auth_feature/data/models/verfication_code_model.dart/response_verification_code_model.dart';
import 'package:route_smart/features/auth_feature/data/models/verfication_code_model.dart/verification_code_request_model.dart';

class AuthRepositoryImpl {
  final AuthRemoteDataSource _remoteDataSource;
  final SecureStorage _secureStorage;

  AuthRepositoryImpl(this._remoteDataSource, this._secureStorage);

  Future<ApiResult<AuthResponseModel>> signIn(SignInRequestModel request) async {
    try {
      final response = await _remoteDataSource.signIn(request);
      await _saveAuthData(response);
      return Success(response);
    } catch (error) {
      return _handleError(error);
    }
  }

  Future<ApiResult<AuthResponseModel>> register(RegisterRequestModel request) async {
    try {
      final response = await _remoteDataSource.register(request);
      await _saveAuthData(response);
      return Success(response);
    } catch (error) {
      return _handleError(error);
    }
  }

  Future<ApiResult<MessageResponseModel>> forgotPassword(ForgotPasswordRequestModel request) async {
    try {
      final response = await _remoteDataSource.forgotPassword(request);
      return Success(response);
    } catch (error) {
      return _handleError(error);
    }
  }

  Future<ApiResult<VerificationCodeResponseModel>> sendResetCode(VerificationCodeRequestModel request) async {
    try {
      final response = await _remoteDataSource.verifyCode(request);
      return Success(response);
    } catch (error) {
      return _handleError(error);
    }
  }

  Future<ApiResult<ResetPasswordResponse>> resetPassword(ResetPasswordRequestModel request) async {
    try {
      final response = await _remoteDataSource.resetPassword(request);
      return Success(response);
    } catch (error) {
      return _handleError(error);
    }
  }

  Future<void> _saveAuthData(AuthResponseModel response) async {
    final token = response.token;
    if (token != null && token.isNotEmpty) {
      await _secureStorage.write(PrefKeys.accessToken, token);

      try {
        final payload = Jwt.parseJwt(token);
        final userId = payload['id'] as String?;
        final exp = payload['exp'] as int?;

        if (userId != null) {
          await _secureStorage.write(PrefKeys.userId, userId);
        }
        if (exp != null) {
          await _secureStorage.write(PrefKeys.tokenExpiry, exp.toString());
        }
      } catch (e) {
        debugPrint('Token decode error: $e');
      }
    }

    final user = response.user;
    if (user != null) {
      await _secureStorage.write(PrefKeys.userName, user.name ?? '');
      await _secureStorage.write(PrefKeys.userEmail, user.email ?? '');
    }
  }

  ApiResult<T> _handleError<T>(Object error) {
    debugPrint('Auth Error: $error');
    if (error is DioException) {
      final message = error.response?.data?['message'] ?? 'Network error';
      return Failure(message);
    }
    return const Failure('An unexpected error occurred');
  }
}