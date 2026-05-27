import 'user_model.dart';

class UsersResponseModel {
  final int totalUsers;
  final List<UserModel> users;

  const UsersResponseModel({
    required this.totalUsers,
    required this.users,
  });

  factory UsersResponseModel.fromJson(Map<String, dynamic> json) {
    return UsersResponseModel(
      totalUsers: json['totalUsers'] as int? ?? 0,
      users: json['users'] != null
          ? (json['users'] as List)
              .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : [],
    );
  }
}