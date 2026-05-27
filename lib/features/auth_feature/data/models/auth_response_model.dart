import 'package:route_smart/features/auth_feature/data/models/user_data_model.dart';

class AuthResponseModel {
  final String? message;
  final UserDataModel? user;
  final String? token;

  AuthResponseModel({this.message, this.user, this.token});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      message: json['message'] as String?,
      user: json['user'] == null 
          ? null 
          : UserDataModel.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'user': user?.toJson(),
        'token': token,
      };
}