
import 'package:route_smart/features/profile/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.id,
    super.name,
    super.email,
    super.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      createdAt: json['createdAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'createdAt': createdAt,
    };
  }
}