import 'package:route_smart/core/services/api/api_services.dart';
import '../models/user_model.dart';

abstract class ProfileRemoteDataSource {
  Future<UserModel> getCurrentUser(String userId);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiService _apiService;
  
  ProfileRemoteDataSourceImpl(this._apiService);

  @override
  Future<UserModel> getCurrentUser(String userId) async {
    final response = await _apiService.getUsers(); 
    
 
   
    final user = response.users.firstWhere(
      (u) => u.id == userId,
      orElse: () => throw Exception('المستخدم غير موجود'),
    );
    
    return user;
  }
}