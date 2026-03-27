// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageResponseModel _$MessageResponseModelFromJson(
  Map<String, dynamic> json,
) => MessageResponseModel(
  statusMsg: json['statusMsg'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$MessageResponseModelToJson(
  MessageResponseModel instance,
) => <String, dynamic>{
  'statusMsg': instance.statusMsg,
  'message': instance.message,
};
