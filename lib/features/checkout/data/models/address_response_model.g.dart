// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressResponseModel _$AddressResponseModelFromJson(
  Map<String, dynamic> json,
) => AddressResponseModel(
  status: json['status'] as String?,
  message: json['message'] as String?,
  results: (json['results'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => AddressModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AddressResponseModelToJson(
  AddressResponseModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'results': instance.results,
  'data': instance.data,
};

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  details: json['details'] as String?,
  phone: json['phone'] as String?,
  city: json['city'] as String?,
);

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'details': instance.details,
      'phone': instance.phone,
      'city': instance.city,
    };
