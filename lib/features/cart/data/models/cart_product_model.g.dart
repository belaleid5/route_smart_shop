// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartProductModel _$CartProductModelFromJson(Map<String, dynamic> json) =>
    CartProductModel(
      id: json['_id'] as String,
      title: json['title'] as String,
      imageUrl: json['imageCover'] as String?,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$CartProductModelToJson(CartProductModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'imageCover': instance.imageUrl,
      'price': instance.price,
    };
