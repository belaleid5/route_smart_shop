import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/checkout/domain/entites/address_entity.dart';
import 'package:route_smart/features/checkout/domain/entites/order_entity.dart';
import 'package:route_smart/features/checkout/domain/entites/shipping_address_entity.dart';

abstract class CheckoutRepository {
  Future<ApiResult<List<AddressEntity>>> getAddresses();

  Future<ApiResult<List<AddressEntity>>> addAddress(AddressEntity address);

  Future<ApiResult<List<AddressEntity>>> removeAddress(String addressId);

  Future<ApiResult<OrderEntity>> createCashOrder({
    required String cartId,
    required ShippingAddressEntity shippingAddress,
  });
}
