import 'package:json_annotation/json_annotation.dart';

part 'user_data_model.g.dart';

@JsonSerializable()
class UserDataModel {
  final String? name;
  final String? email;
  final String? role;

  UserDataModel({this.name, this.email, this.role});

  factory UserDataModel.fromJson(Map<String, dynamic> json) => _$UserDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);
}