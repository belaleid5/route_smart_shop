import 'package:json_annotation/json_annotation.dart';
part 'response_verification_code_model.g.dart';

@JsonSerializable()
class VerificationCodeResponseModel {
  final String? status;


  VerificationCodeResponseModel({this.status,});

  factory VerificationCodeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerificationCodeResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$VerificationCodeResponseModelToJson(this);
}