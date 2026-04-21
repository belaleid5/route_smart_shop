// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDataModel _$OrderDataModelFromJson(Map<String, dynamic> json) =>
    OrderDataModel(
      id: json['_id'] as String?,
      shippingAddress: json['shippingAddress'] == null
          ? null
          : ShippingAddressModel.fromJson(
              json['shippingAddress'] as Map<String, dynamic>,
            ),
      taxPrice: (json['taxPrice'] as num?)?.toDouble(),
      shippingPrice: (json['shippingPrice'] as num?)?.toDouble(),
      totalOrderPrice: (json['totalOrderPrice'] as num?)?.toDouble(),
      paymentMethodType: json['paymentMethodType'] as String?,
      isPaid: json['isPaid'] as bool?,
      isDelivered: json['isDelivered'] as bool?,
      user: json['user'] == null
          ? null
          : OrderUserModel.fromJson(json['user'] as Map<String, dynamic>),
      cartItems: (json['cartItems'] as List<dynamic>?)
          ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$OrderDataModelToJson(OrderDataModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'shippingAddress': instance.shippingAddress,
      'taxPrice': instance.taxPrice,
      'shippingPrice': instance.shippingPrice,
      'totalOrderPrice': instance.totalOrderPrice,
      'paymentMethodType': instance.paymentMethodType,
      'isPaid': instance.isPaid,
      'isDelivered': instance.isDelivered,
      'user': instance.user,
      'cartItems': instance.cartItems,
      'createdAt': instance.createdAt,
    };
