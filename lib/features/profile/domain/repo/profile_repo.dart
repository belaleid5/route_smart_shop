

import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/profile/domain/entites/user_entity.dart';

abstract class ProfileRepository {
  Future<ApiResult<UserEntity>> getCurrentUser(String userId);
}