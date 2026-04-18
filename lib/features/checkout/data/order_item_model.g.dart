// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) =>
    OrderItemModel(
      id: json['_id'] as String?,
      count: (json['count'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      product: json['product'] == null
          ? null
          : OrderItemProduct.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderItemModelToJson(OrderItemModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'count': instance.count,
      'price': instance.price,
      'product': instance.product,
    };

OrderItemProduct _$OrderItemProductFromJson(Map<String, dynamic> json) =>
    OrderItemProduct(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      imageCover: json['imageCover'] as String?,
      ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OrderItemProductToJson(OrderItemProduct instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'imageCover': instance.imageCover,
      'ratingsAverage': instance.ratingsAverage,
    };
