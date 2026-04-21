import 'package:json_annotation/json_annotation.dart';

part 'ephemeral_key_response_model.g.dart';

@JsonSerializable()
class EphemeralKeyResponseModel {
  final String? id;
  final String? object;
  final int? created;
  final int? expires;
  final bool? livemode;
  final String? secret;

  @JsonKey(name: 'associated_objects')
  final List<AssociatedObject>? associatedObjects;

  const EphemeralKeyResponseModel({
    this.id,
    this.object,
    this.created,
    this.expires,
    this.livemode,
    this.secret,
    this.associatedObjects,
  });

  factory EphemeralKeyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EphemeralKeyResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$EphemeralKeyResponseModelToJson(this);
}

@JsonSerializable()
class AssociatedObject {
  final String? type;
  final String? id;

  const AssociatedObject({this.type, this.id});

  factory AssociatedObject.fromJson(Map<String, dynamic> json) =>
      _$AssociatedObjectFromJson(json);

  Map<String, dynamic> toJson() => _$AssociatedObjectToJson(this);
}
