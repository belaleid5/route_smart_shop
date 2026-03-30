import 'package:json_annotation/json_annotation.dart';
part 'reset_password_response.g.dart';

@JsonSerializable()
class ResetPasswordResponse {
  final String token;


  ResetPasswordResponse({required this.token,});

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResetPasswordResponseToJson(this);
}