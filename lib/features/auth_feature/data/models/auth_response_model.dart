import 'package:json_annotation/json_annotation.dart';
import 'package:route_smart/features/auth_feature/data/models/user_data_model.dart';

part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel {
  final String? message;
  final UserDataModel? user;
  final String? token;

  AuthResponseModel({this.message, this.user, this.token});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseModelToJson(this);
}
