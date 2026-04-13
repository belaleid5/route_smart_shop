// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponseModel _$CartResponseModelFromJson(Map<String, dynamic> json) =>
    CartResponseModel(
      status: json['status'] as String,
      itemCount: (json['numOfCartItems'] as num).toInt(),
      message: json['message'] as String?,
      cartId: json['cartId'] as String?,
      data: json['data'] == null
          ? null
          : CartDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartResponseModelToJson(CartResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'numOfCartItems': instance.itemCount,
      'cartId': instance.cartId,
      'data': instance.data,
    };
