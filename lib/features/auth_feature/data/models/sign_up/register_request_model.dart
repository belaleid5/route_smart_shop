import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

/// Request body model for the user registration endpoint.
@JsonSerializable()
class RegisterRequestModel {
  const RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });

  final String name;
  final String email;
  final String password;
  final String rePassword;
  final String phone;

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}