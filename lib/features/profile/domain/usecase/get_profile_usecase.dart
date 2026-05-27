
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/core/services/flutter_secure.dart';
import 'package:route_smart/core/services/shared_pref/shared_keys.dart';
import 'package:route_smart/features/profile/domain/entites/user_entity.dart';
import 'package:route_smart/features/profile/domain/repo/profile_repo.dart';

class GetProfileUseCase {
  final ProfileRepository _repository;
  final SecureStorage _secureStorage;

  GetProfileUseCase(this._repository, this._secureStorage);

  Future<ApiResult<UserEntity>> call(String userId) async {
    final cachedName = await _secureStorage.read(PrefKeys.userName) ?? ''; 
    final cachedEmail = await _secureStorage.read(PrefKeys.userEmail) ?? '';

    if (cachedName.isNotEmpty || cachedEmail.isNotEmpty) {
      return ApiResult.success(UserEntity(
        name: cachedName,
        email: cachedEmail,
      ));
    }

    return await _repository.getCurrentUser(userId);
  }
}