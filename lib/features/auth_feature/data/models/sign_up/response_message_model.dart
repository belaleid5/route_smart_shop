import 'package:json_annotation/json_annotation.dart';
import 'package:route_smart/features/auth_feature/data/models/sign_up/user_data_model.dart';

part 'response_message_model.g.dart';



@JsonSerializable()
class RegisterResponseModel {
  final String? message;
  final UserDataModel? user;
  final String? token;

  RegisterResponseModel({this.message, this.user, this.token});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => _$RegisterResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterResponseModelToJson(this);
}