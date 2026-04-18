import 'package:route_smart/core/errors/api_error_handler.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/checkout/data/address_response_model.dart';
import 'package:route_smart/features/checkout/data/order_response_model.dart';
import 'package:route_smart/features/checkout/data/shipping_address_model.dart';
import 'package:route_smart/features/checkout/data_source/checkout_remote_data_source.dart';

class CheckoutRepository {
  final CheckoutRemoteDataSource _remote;

  CheckoutRepository(this._remote);

  Future<ApiResult<List<AddressModel>>> getAddresses() async {
    try {
      final res = await _remote.getAddresses();
      return ApiResult.success(res.data ?? []);
    } catch (e) {
      return ApiResult.failure(
        ErrorHandler.handle(e).apiErrorModel.message ?? 'Error',
      );
    }
  }

  Future<ApiResult<List<AddressModel>>> addAddress(AddressModel address) async {
    try {
      final res = await _remote.addAddress(address);
      return ApiResult.success(res.data ?? []);
    } catch (e) {
      return ApiResult.failure(
        ErrorHandler.handle(e).apiErrorModel.message ?? 'Error',
      );
    }
  }

  Future<ApiResult<List<AddressModel>>> removeAddress(String addressId) async {
    try {
      final res = await _remote.removeAddress(addressId);
      return ApiResult.success(res.data ?? []);
    } catch (e) {
      return ApiResult.failure(
        ErrorHandler.handle(e).apiErrorModel.message ?? 'Error',
      );
    }
  }

  Future<ApiResult<OrderResponseModel>> createCashOrder({
    required String cartId,
    required ShippingAddressModel shippingAddress,
  }) async {
    try {
      final res = await _remote.createCashOrder(
        cartId: cartId,
        shippingAddress: shippingAddress,
      );
      return ApiResult.success(res);
    } catch (e) {
      return ApiResult.failure(
        ErrorHandler.handle(e).apiErrorModel.message ?? 'Error',
      );
    }
  }
}