import 'package:route_smart/core/services/api/api_services.dart';
import 'package:route_smart/features/auth_feature/data/models/auth_response_model.dart';
import 'package:route_smart/features/auth_feature/data/models/forgot_password/forgot_password_request_model.dart';
import 'package:route_smart/features/auth_feature/data/models/message_response_model.dart';
import 'package:route_smart/features/auth_feature/data/models/reset_password/reset_password_request_model.dart';
import 'package:route_smart/features/auth_feature/data/models/reset_password/reset_password_response.dart';
import 'package:route_smart/features/auth_feature/data/models/sign_in/sign_in_request_model.dart';
import 'package:route_smart/features/auth_feature/data/models/sign_up/register_request_model.dart';
import 'package:route_smart/features/auth_feature/data/models/verfication_code_model.dart/response_verification_code_model.dart';
import 'package:route_smart/features/auth_feature/data/models/verfication_code_model.dart/verification_code_request_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> signIn(SignInRequestModel request);
  Future<AuthResponseModel> register(RegisterRequestModel request);
  Future<MessageResponseModel> forgotPassword(ForgotPasswordRequestModel request);
  Future<VerificationCodeResponseModel> verifyCode(VerificationCodeRequestModel request);
  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequestModel request);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService _apiService;

  AuthRemoteDataSourceImpl(this._apiService);

  @override
  Future<AuthResponseModel> signIn(SignInRequestModel request) async => 
      await _apiService.signIn(request);

  @override
  Future<AuthResponseModel> register(RegisterRequestModel request) async => 
      await _apiService.register(request);

  @override
  Future<MessageResponseModel> forgotPassword(ForgotPasswordRequestModel request) async => 
      await _apiService.forgotPassword(request);

  @override
  Future<VerificationCodeResponseModel> verifyCode(VerificationCodeRequestModel request) async => 
      await _apiService.verifyResetCode(request);

  @override
  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequestModel request) async => 
      await _apiService.resetPassword(request);
}