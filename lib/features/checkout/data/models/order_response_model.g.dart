// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponseModel _$OrderResponseModelFromJson(Map<String, dynamic> json) =>
    OrderResponseModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : OrderUserModel.fromJson(json['user'] as Map<String, dynamic>),
      pricing: json['pricing'] == null
          ? null
          : OrderPricingModel.fromJson(json['pricing'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : OrderDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderResponseModelToJson(OrderResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'user': instance.user,
      'pricing': instance.pricing,
      'data': instance.data,
    };
