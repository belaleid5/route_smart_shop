import 'package:route_smart/core/services/api/api_services.dart';
import 'package:route_smart/features/auth_feature/data/models/sign_up/register_request_model.dart';
import 'package:route_smart/features/auth_feature/data/models/sign_up/response_message_model.dart';

abstract class AuthRemoteDataSource {
  // Future<LoginResponse> login(LoginRequest loginRequest);

  Future<RegisterResponseModel> register(RegisterRequestModel registerRequest);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService _apiService;

  AuthRemoteDataSourceImpl(this._apiService);

  // @override
  // Future<LoginResponse> login(LoginRequest loginRequest) async {
  //   return await _apiService.login(loginRequest);
  // }

  @override
  Future<RegisterResponseModel> register(
    RegisterRequestModel registerRequest,
  ) async {
    return await _apiService.register(registerRequest);
  }
}
