class VerificationCodeResponseModel {
  final String? status;

  VerificationCodeResponseModel({this.status});

  factory VerificationCodeResponseModel.fromJson(Map<String, dynamic> json) {
    return VerificationCodeResponseModel(status: json['status'] as String?);
  }

  Map<String, dynamic> toJson() => {'status': status};
}