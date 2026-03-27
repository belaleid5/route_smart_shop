import 'package:json_annotation/json_annotation.dart';
part 'verification_code_request_model.g.dart';

@JsonSerializable()
class VerificationCodeRequestModel {
  final String? resetCode;


  VerificationCodeRequestModel({this.resetCode,});

  factory VerificationCodeRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerificationCodeRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$VerificationCodeRequestModelToJson(this);
}