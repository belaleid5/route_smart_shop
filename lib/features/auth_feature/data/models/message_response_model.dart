class MessageResponseModel {
  final String? statusMsg;
  final String? message;

  MessageResponseModel({this.statusMsg, this.message});

  factory MessageResponseModel.fromJson(Map<String, dynamic> json) {
    return MessageResponseModel(
      statusMsg: json['statusMsg'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'statusMsg': statusMsg,
        'message': message,
      };
}