class SignInRequestModel {
  final String email;
  final String password;

  const SignInRequestModel({required this.email, required this.password});

  factory SignInRequestModel.fromJson(Map<String, dynamic> json) {
    return SignInRequestModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}