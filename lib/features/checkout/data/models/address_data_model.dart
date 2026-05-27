import 'package:route_smart/features/checkout/domain/entites/address_entity.dart';

class AddressDataModel extends AddressEntity {
  AddressDataModel({
    String? id,
    super.name,
    super.details,
    super.phone,
    super.city,
  }) : super(id: id ?? '');

  factory AddressDataModel.fromJson(Map<String, dynamic> json) {
    return AddressDataModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      details: json['details'] as String?,
      phone: json['phone'] as String?,
      city: json['city'] as String?,
    );
  }

  static List<AddressDataModel> listFromJson(Map<String, dynamic> json) {
    final data = json['data'] as List<dynamic>? ?? [];
    return data
        .map((item) => AddressDataModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'details': details,
        'phone': phone,
        'city': city,
      };

  factory AddressDataModel.fromEntity(AddressEntity entity) {
    return AddressDataModel(
      id: entity.id,
      name: entity.name,
      details: entity.details,
      phone: entity.phone,
      city: entity.city,
    );
  }
}