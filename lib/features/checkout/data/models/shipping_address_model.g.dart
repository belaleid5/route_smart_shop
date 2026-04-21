// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingAddressModel _$ShippingAddressModelFromJson(
  Map<String, dynamic> json,
) => ShippingAddressModel(
  details: json['details'] as String?,
  phone: json['phone'] as String?,
  city: json['city'] as String?,
  postalCode: json['postalCode'] as String?,
);

Map<String, dynamic> _$ShippingAddressModelToJson(
  ShippingAddressModel instance,
) => <String, dynamic>{
  'details': instance.details,
  'phone': instance.phone,
  'city': instance.city,
  'postalCode': instance.postalCode,
};
