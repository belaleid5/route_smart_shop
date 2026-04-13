// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    CartItemModel(
      cartItemId: json['_id'] as String,
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      quantity: (json['count'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$CartItemModelToJson(CartItemModel instance) =>
    <String, dynamic>{
      '_id': instance.cartItemId,
      'productId': instance.productId,
      'productName': instance.productName,
      'count': instance.quantity,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
    };
