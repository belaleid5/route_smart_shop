// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ephemeral_key_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EphemeralKeyResponseModel _$EphemeralKeyResponseModelFromJson(
  Map<String, dynamic> json,
) => EphemeralKeyResponseModel(
  id: json['id'] as String?,
  object: json['object'] as String?,
  created: (json['created'] as num?)?.toInt(),
  expires: (json['expires'] as num?)?.toInt(),
  livemode: json['livemode'] as bool?,
  secret: json['secret'] as String?,
  associatedObjects: (json['associated_objects'] as List<dynamic>?)
      ?.map((e) => AssociatedObject.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$EphemeralKeyResponseModelToJson(
  EphemeralKeyResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'created': instance.created,
  'expires': instance.expires,
  'livemode': instance.livemode,
  'secret': instance.secret,
  'associated_objects': instance.associatedObjects,
};

AssociatedObject _$AssociatedObjectFromJson(Map<String, dynamic> json) =>
    AssociatedObject(type: json['type'] as String?, id: json['id'] as String?);

Map<String, dynamic> _$AssociatedObjectToJson(AssociatedObject instance) =>
    <String, dynamic>{'type': instance.type, 'id': instance.id};
