import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:route_smart/core/constants/api_constants.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;




}
