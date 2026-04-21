import 'package:json_annotation/json_annotation.dart';

part 'address_response_model.g.dart';

@JsonSerializable()
class AddressResponseModel {
  final String? status;
  final String? message;
  final int? results;
  final List<AddressModel>? data;

  const AddressResponseModel({
    this.status,
    this.message,
    this.results,
    this.data,
  });

  factory AddressResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressResponseModelToJson(this);
}

@JsonSerializable()
class AddressModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? details;
  final String? phone;
  final String? city;

  const AddressModel({
    this.id,
    this.name,
    this.details,
    this.phone,
    this.city,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}