import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:route_smart/core/constants/api_constants.dart';
import 'package:route_smart/features/auth_feature/data/models/auth_response_model.dart';
import 'package:route_smart/features/auth_feature/data/models/forgot_password/forgot_password_request_model.dart';
import 'package:route_smart/features/auth_feature/data/models/message_response_model.dart';
import 'package:route_smart/features/auth_feature/data/models/sign_in/sign_in_request_model.dart';
import 'package:route_smart/features/auth_feature/data/models/sign_up/register_request_model.dart';
import 'package:route_smart/features/auth_feature/data/models/verfication_code_model.dart/response_verification_code_model.dart';
import 'package:route_smart/features/auth_feature/data/models/verfication_code_model.dart/verification_code_request_model.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.signup)
  Future<AuthResponseModel> register(
    @Body() RegisterRequestModel registerRequest,
  );

  @POST(ApiConstants.signin)
  Future<AuthResponseModel> signIn(
    @Body() SignInRequestModel signInRequest,
  );

   @POST(ApiConstants.forgotPassword)
  Future<MessageResponseModel> forgotPassword(
    @Body() ForgotPasswordRequestModel forgotPasswordRequest,
  );


   @POST(ApiConstants.verifyResetCode)
  Future<VerificationCodeResponseModel> verifyResetCode(
    @Body() VerificationCodeRequestModel forgotPasswordRequest,
  );
}
