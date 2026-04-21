import 'package:json_annotation/json_annotation.dart';

part 'shipping_address_model.g.dart';

@JsonSerializable()
class ShippingAddressModel {
  final String? details;
  final String? phone;
  final String? city;
  final String? postalCode;

  const ShippingAddressModel({
    this.details,
    this.phone,
    this.city,
    this.postalCode,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressModelToJson(this);
}