import 'package:route_smart/core/services/api/api_services.dart';
import 'package:route_smart/features/checkout/data/models/address_model.dart';
import 'package:route_smart/features/checkout/data/models/order_model.dart';
import 'package:route_smart/features/checkout/domain/entites/address_entity.dart';
import 'package:route_smart/features/checkout/domain/entites/shipping_address_entity.dart';

abstract class CheckoutRemoteDataSource {
  Future<List<AddressModel>> getAddresses();
  Future<List<AddressModel>> addAddress(AddressEntity address);
  Future<List<AddressModel>> removeAddress(String addressId);
  Future<OrderModel> createCashOrder({
    required String cartId,
    required ShippingAddressEntity shippingAddress,
  });
}

class CheckoutRemoteDataSourceImpl implements CheckoutRemoteDataSource {
  final ApiService _apiService;

  const CheckoutRemoteDataSourceImpl(this._apiService);

  AddressModel _toAddressModel(e) => AddressModel(
        id: e.id,
        name: e.name,
        details: e.details,
        phone: e.phone,
        city: e.city,
      );

  @override
  Future<List<AddressModel>> getAddresses() async {
    final data = await _apiService.getAddresses();
    return data.map(_toAddressModel).toList();
  }

  @override
  Future<List<AddressModel>> addAddress(AddressEntity address) async {
    final body = {
      if (address.name != null) 'name': address.name,
      if (address.details != null) 'details': address.details,
      if (address.phone != null) 'phone': address.phone,
      if (address.city != null) 'city': address.city,
    };
    final data = await _apiService.addAddress(body);
    return data.map(_toAddressModel).toList();
  }

  @override
  Future<List<AddressModel>> removeAddress(String addressId) async {
    final data = await _apiService.removeAddress(addressId);
    return data.map(_toAddressModel).toList();
  }

  @override
  Future<OrderModel> createCashOrder({
    required String cartId,
    required ShippingAddressEntity shippingAddress,
  }) =>
      _apiService.createCashOrder(
        cartId,
        {'shippingAddress': shippingAddress.toJson()},
      );
}