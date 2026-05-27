class RegisterRequestModel {
  final String name;
  final String email;
  final String password;
  final String rePassword;
  final String phone;

  const RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    return RegisterRequestModel(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      rePassword: json['rePassword'] as String,
      phone: json['phone'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'rePassword': rePassword,
        'phone': phone,
      };
}