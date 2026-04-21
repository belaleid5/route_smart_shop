// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_pricing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderPricingModel _$OrderPricingModelFromJson(Map<String, dynamic> json) =>
    OrderPricingModel(
      cartPrice: (json['cartPrice'] as num?)?.toDouble(),
      taxPrice: (json['taxPrice'] as num?)?.toDouble(),
      shippingPrice: (json['shippingPrice'] as num?)?.toDouble(),
      totalOrderPrice: (json['totalOrderPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OrderPricingModelToJson(OrderPricingModel instance) =>
    <String, dynamic>{
      'cartPrice': instance.cartPrice,
      'taxPrice': instance.taxPrice,
      'shippingPrice': instance.shippingPrice,
      'totalOrderPrice': instance.totalOrderPrice,
    };
