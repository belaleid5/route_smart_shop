// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
  id: json['_id'] as String,
  userId: json['cartOwner'] as String,
  items: (json['products'] as List<dynamic>)
      .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalPrice: (json['totalCartPrice'] as num).toDouble(),
);

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
  '_id': instance.id,
  'cartOwner': instance.userId,
  'products': instance.items,
  'totalCartPrice': instance.totalPrice,
};
