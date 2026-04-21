// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderUserModel _$OrderUserModelFromJson(Map<String, dynamic> json) =>
    OrderUserModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$OrderUserModelToJson(OrderUserModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
    };
