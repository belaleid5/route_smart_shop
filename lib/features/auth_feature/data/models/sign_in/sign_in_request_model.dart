import 'package:json_annotation/json_annotation.dart';

part 'sign_in_request_model.g.dart';

/// Request body model for the user registration endpoint.
@JsonSerializable()
class SignInRequestModel {
  const SignInRequestModel({

    required this.email,
    required this.password,

  });


  final String email;
  final String password;


  factory SignInRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignInRequestModelToJson(this);
}