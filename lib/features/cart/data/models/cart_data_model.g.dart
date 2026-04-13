// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartDataModel _$CartDataModelFromJson(Map<String, dynamic> json) =>
    CartDataModel(
      products: (json['products'] as List<dynamic>)
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPrice: (json['totalCartPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$CartDataModelToJson(CartDataModel instance) =>
    <String, dynamic>{
      'products': instance.products,
      'totalCartPrice': instance.totalPrice,
    };
