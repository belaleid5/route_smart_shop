import 'package:route_smart/core/errors/api_error_handler.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/checkout/data/data_source/checkout_remote_datasource.dart';
import 'package:route_smart/features/checkout/domain/entites/address_entity.dart';
import 'package:route_smart/features/checkout/domain/entites/order_entity.dart';
import 'package:route_smart/features/checkout/domain/entites/shipping_address_entity.dart';
import 'package:route_smart/features/checkout/domain/repo/checkout_repository.dart';

class CheckoutRepositoryImpl implements CheckoutRepository {
  final CheckoutRemoteDataSource _remote;

  const CheckoutRepositoryImpl(this._remote);

  @override
  Future<ApiResult<List<AddressEntity>>> getAddresses() async {
    try {
      return ApiResult.success(await _remote.getAddresses());
    } catch (e) {
      return ApiResult.failure(_errorMessage(e));
    }
  }

  @override
  Future<ApiResult<List<AddressEntity>>> addAddress(
    AddressEntity address,
  ) async {
    try {
      return ApiResult.success(await _remote.addAddress(address));
    } catch (e) {
      return ApiResult.failure(_errorMessage(e));
    }
  }

  @override
  Future<ApiResult<List<AddressEntity>>> removeAddress(
    String addressId,
  ) async {
    try {
      return ApiResult.success(await _remote.removeAddress(addressId));
    } catch (e) {
      return ApiResult.failure(_errorMessage(e));
    }
  }

  @override
  Future<ApiResult<OrderEntity>> createCashOrder({
    required String cartId,
    required ShippingAddressEntity shippingAddress,
  }) async {
    try {
      return ApiResult.success(
        await _remote.createCashOrder(
          cartId: cartId,
          shippingAddress: shippingAddress,
        ),
      );
    } catch (e) {
      return ApiResult.failure(_errorMessage(e));
    }
  }

  String _errorMessage(Object e) =>
      ErrorHandler.handle(e).apiErrorModel.message ?? 'Something went wrong';
}
