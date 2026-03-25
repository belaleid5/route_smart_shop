import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:route_smart/core/constants/api_constants.dart';
import 'package:route_smart/features/auth_feature/data/models/sign_up/register_request_model.dart';
import 'package:route_smart/features/auth_feature/data/models/sign_up/response_message_model.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.signup)
  Future<RegisterResponseModel> register(
    @Body() RegisterRequestModel registerRequest,
  );
}
