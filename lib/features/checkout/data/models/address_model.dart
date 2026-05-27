
import 'package:route_smart/features/checkout/domain/entites/address_entity.dart';

class AddressModel extends AddressEntity {
  const AddressModel({
    super.id,
    super.name,
    super.details,
    super.phone,
    super.city,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        details: json['details'] as String?,
        phone: json['phone'] as String?,
        city: json['city'] as String?,
      );

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        if (details != null) 'details': details,
        if (phone != null) 'phone': phone,
        if (city != null) 'city': city,
      };
}

class AddressResponseModel {
  final String? status;
  final List<AddressModel> data;

  const AddressResponseModel({this.status, required this.data});

  factory AddressResponseModel.fromJson(Map<String, dynamic> json) =>
      AddressResponseModel(
        status: json['status'] as String?,
        data: (json['data'] as List<dynamic>? ?? [])
            .map((e) => AddressModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
