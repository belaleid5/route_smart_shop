
import 'package:route_smart/core/errors/api_error_handler.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/auth_feature/data/data_source/auth_data_source.dart';
import 'package:route_smart/features/auth_feature/data/models/sign_up/register_request_model.dart';
import 'package:route_smart/features/auth_feature/data/models/sign_up/response_message_model.dart';



class AuthRepositoryImpl{
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  // Future<ApiResult<LoginResponse>> login(LoginRequest loginRequest) async { ... }

  Future<ApiResult<RegisterResponseModel>> register(RegisterRequestModel registerRequest) async {
    try {
      final response = await _remoteDataSource.register(registerRequest);
      
      return ApiResult.success(response);
      
    } catch (error) {
      final errorHandler = ErrorHandler.handle(error);
      final errorMessage = errorHandler.apiErrorModel.message ?? ResponseMessage.DEFAULT;
      return ApiResult.failure(errorMessage);
    }
  }
}