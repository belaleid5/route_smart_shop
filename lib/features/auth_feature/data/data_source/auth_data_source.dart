import 'package:route_smart/core/services/api/api_services.dart';
import 'package:route_smart/features/auth_feature/data/models/auth_response_model.dart';
import 'package:route_smart/features/auth_feature/data/models/forgot_password/forgot_password_request_model.dart';
import 'package:route_smart/features/auth_feature/data/models/message_response_model.dart';
import 'package:route_smart/features/auth_feature/data/models/sign_in/sign_in_request_model.dart';
import 'package:route_smart/features/auth_feature/data/models/sign_up/register_request_model.dart';
import 'package:route_smart/features/auth_feature/data/models/verfication_code_model.dart/response_verification_code_model.dart';
import 'package:route_smart/features/auth_feature/data/models/verfication_code_model.dart/verification_code_request_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> signIn(SignInRequestModel signInRequest);

  Future<AuthResponseModel> register(RegisterRequestModel registerRequest);

  Future<MessageResponseModel> forgotPassword(
    ForgotPasswordRequestModel forgotPasswordRequest,
  );

  Future<VerificationCodeResponseModel> verifyCode(
    VerificationCodeRequestModel verifyResetCodeRequest,
  );
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService _apiService;

  AuthRemoteDataSourceImpl(this._apiService);

  @override
  Future<AuthResponseModel> signIn(SignInRequestModel signInRequest) async {
    return await _apiService.signIn(signInRequest);
  }

  @override
  Future<AuthResponseModel> register(
    RegisterRequestModel registerRequest,
  ) async {
    return await _apiService.register(registerRequest);
  }

  @override
  Future<MessageResponseModel> forgotPassword(
    ForgotPasswordRequestModel forgotPasswordRequest,
  ) async {
    return await _apiService.forgotPassword(forgotPasswordRequest);
  }

  @override
  Future<VerificationCodeResponseModel> verifyCode(
    VerificationCodeRequestModel verifyResetCodeRequest,
  ) async {
    return await _apiService.verifyResetCode(verifyResetCodeRequest);
  }
}
