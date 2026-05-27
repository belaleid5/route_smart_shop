class ResetPasswordResponse {
  final String token;

  ResetPasswordResponse({required this.token});

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponse(token: json['token'] as String);
  }

  Map<String, dynamic> toJson() => {'token': token};
}