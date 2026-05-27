import 'package:dio/dio.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/profile/data/data_source/user_data_source.dart';
import 'package:route_smart/features/profile/domain/entites/user_entity.dart';
import 'package:route_smart/features/profile/domain/repo/profile_repo.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;
  
  ProfileRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResult<UserEntity>> getCurrentUser(String userId) async {
    try {
      final userModel = await _remoteDataSource.getCurrentUser(userId);
      return ApiResult.success(userModel);
    } on DioException catch (e) {
      return ApiResult.failure(e.message ?? 'حدث خطأ في الاتصال');
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}