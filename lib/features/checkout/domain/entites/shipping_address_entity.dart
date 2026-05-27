class ShippingAddressEntity {
  final String details;
  final String phone;
  final String city;

  const ShippingAddressEntity({
    required this.details,
    required this.phone,
    required this.city,
  });

  Map<String, dynamic> toJson() => {
        'details': details,
        'phone': phone,
        'city': city,
      };
}
