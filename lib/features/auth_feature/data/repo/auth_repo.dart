// features/auth_feature/data/repo/auth_repo.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/errors/api_error_handler.dart';
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
  final SecureStorage _secureStorage;              // ← أضف

  AuthRepositoryImpl(
    this._remoteDataSource,
    this._secureStorage,                           // ← أضف
  );

  // ── SignIn ─────────────────────────────────────
  Future<ApiResult<AuthResponseModel>> signIn(
    SignInRequestModel signInRequest,
  ) async {
    try {
      final response = await _remoteDataSource.signIn(signInRequest);

      // ✅ احفظ الـ Token
      final token = response.token;
      if (token != null && token.isNotEmpty) {
        await _secureStorage.setString(
          PrefKeys.accessToken,
          token,
        );
        debugPrint('✅ Token saved: $token');
      }

      return ApiResult.success(response);
    } catch (error) {
      final errorHandler = ErrorHandler.handle(error);
      final errorMessage =
          errorHandler.apiErrorModel.message ?? ResponseMessage.DEFAULT;
      return ApiResult.failure(errorMessage);
    }
  }

  // ── Register ───────────────────────────────────
  Future<ApiResult<AuthResponseModel>> register(
    RegisterRequestModel registerRequest,
  ) async {
    try {
      final response = await _remoteDataSource.register(registerRequest);

      final token = response.token;
      if (token != null && token.isNotEmpty) {
        await _secureStorage.setString(
          PrefKeys.accessToken,
          token,
        );
        debugPrint('✅ Token saved after register: $token');
      }

      return ApiResult.success(response);
    } catch (error) {
      final errorHandler = ErrorHandler.handle(error);
      final errorMessage =
          errorHandler.apiErrorModel.message ?? ResponseMessage.DEFAULT;
      return ApiResult.failure(errorMessage);
    }
  }

  // ── Forgot Password ────────────────────────────
  Future<ApiResult<MessageResponseModel>> forgotPassword(
    ForgotPasswordRequestModel forgotPasswordRequest,
  ) async {
    try {
      final response = await _remoteDataSource.forgotPassword(
        forgotPasswordRequest,
      );
      return ApiResult.success(response);
    } catch (error) {
      final errorHandler = ErrorHandler.handle(error);
      final errorMessage =
          errorHandler.apiErrorModel.message ?? ResponseMessage.DEFAULT;
      return ApiResult.failure(errorMessage);
    }
  }

  // ── Verify Code ────────────────────────────────
  Future<ApiResult<VerificationCodeResponseModel>> sendResetCode(
    VerificationCodeRequestModel verifyCodedRequest,
  ) async {
    try {
      final response = await _remoteDataSource.verifyCode(verifyCodedRequest);
      return ApiResult.success(response);
    } catch (error) {
      final errorHandler = ErrorHandler.handle(error);
      final errorMessage =
          errorHandler.apiErrorModel.message ?? ResponseMessage.DEFAULT;
      return ApiResult.failure(errorMessage);
    }
  }

  // ── Reset Password ─────────────────────────────
  Future<ApiResult<ResetPasswordResponse>> resetPassword(
    ResetPasswordRequestModel resetPasswordRequest,
  ) async {
    try {
      final response = await _remoteDataSource.resetPassword(
        resetPasswordRequest,
      );
      return ApiResult.success(response);
    } catch (error) {
      final errorHandler = ErrorHandler.handle(error);
      final errorMessage =
          errorHandler.apiErrorModel.message ?? ResponseMessage.DEFAULT;
      return ApiResult.failure(errorMessage);
    }
  }
}