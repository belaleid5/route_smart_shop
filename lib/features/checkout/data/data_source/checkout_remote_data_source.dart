import 'package:route_smart/core/services/api/api_services.dart';
import 'package:route_smart/core/services/flutter_secure.dart';
import 'package:route_smart/core/services/shared_pref/shared_keys.dart';
import 'package:route_smart/features/checkout/data/models/address_response_model.dart';
import 'package:route_smart/features/checkout/data/models/order_response_model.dart';
import 'package:route_smart/features/checkout/data/models/shipping_address_model.dart';

abstract class CheckoutRemoteDataSource {
  Future<AddressResponseModel> getAddresses();
  Future<AddressResponseModel> addAddress(AddressModel address);
  Future<AddressResponseModel> removeAddress(String addressId);
  Future<OrderResponseModel> createCashOrder({
    required String cartId,
    required ShippingAddressModel shippingAddress,
  });
}

class CheckoutRemoteDataSourceImpl implements CheckoutRemoteDataSource {
  final ApiService _apiService;
  final SecureStorage _secureStorage;

  CheckoutRemoteDataSourceImpl(this._apiService, this._secureStorage);

  Future<String> get _token async {
    final token = await _secureStorage.getString(PrefKeys.accessToken);
    return token ?? '';
  }

  @override
  Future<AddressResponseModel> getAddresses() async {
    return await _apiService.getAddresses(await _token);
  }

  @override
  Future<AddressResponseModel> addAddress(AddressModel address) async {
    return await _apiService.addAddress(
      await _token,
      address.toJson(),
    );
  }

  @override
  Future<AddressResponseModel> removeAddress(String addressId) async {
    return await _apiService.removeAddress(await _token, addressId);
  }

  @override
  Future<OrderResponseModel> createCashOrder({
    required String cartId,
    required ShippingAddressModel shippingAddress,
  }) async {
    return await _apiService.createCashOrder(
      await _token,
      cartId,
      {'shippingAddress': shippingAddress.toJson()},
    );
  }
}