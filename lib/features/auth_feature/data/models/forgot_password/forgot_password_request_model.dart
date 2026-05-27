class ForgotPasswordRequestModel {
  final String? email;

  ForgotPasswordRequestModel({this.email});

  factory ForgotPasswordRequestModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordRequestModel(email: json['email'] as String?);
  }

  Map<String, dynamic> toJson() => {'email': email};
}