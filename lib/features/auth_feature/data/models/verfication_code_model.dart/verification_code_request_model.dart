class VerificationCodeRequestModel {
  final String? resetCode;

  VerificationCodeRequestModel({this.resetCode});

  factory VerificationCodeRequestModel.fromJson(Map<String, dynamic> json) {
    return VerificationCodeRequestModel(resetCode: json['resetCode'] as String?);
  }

  Map<String, dynamic> toJson() => {'resetCode': resetCode};
}