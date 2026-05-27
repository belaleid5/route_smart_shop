
class ApiErrorModel {
  final String? message;
  final int? code;

  const ApiErrorModel({this.message, this.code});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      message: json['message'] as String? ?? json['error'] as String?,
      code: json['code'] as int? ?? json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'code': code,
      };
}