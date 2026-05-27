class UserDataModel {
  final String? name;
  final String? email;
  final String? role;

  UserDataModel({this.name, this.email, this.role});

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      name: json['name'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'role': role,
      };
}