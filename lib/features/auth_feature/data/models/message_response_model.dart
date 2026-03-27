import 'package:json_annotation/json_annotation.dart';
part 'message_response_model.g.dart';

@JsonSerializable()
class MessageResponseModel {
  final String? statusMsg, message;


  MessageResponseModel({this.statusMsg,this.message});

  factory MessageResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$MessageResponseModelToJson(this);
}