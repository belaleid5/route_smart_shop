class ResetPasswordRequestModel {
  final String? email;
  final String? newPassword;

  ResetPasswordRequestModel({this.email, this.newPassword});

  factory ResetPasswordRequestModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordRequestModel(
      email: json['email'] as String?,
      newPassword: json['newPassword'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'newPassword': newPassword,
      };
}