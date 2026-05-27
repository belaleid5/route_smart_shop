import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/checkout/domain/entites/address_entity.dart';
import 'package:route_smart/features/checkout/domain/entites/order_entity.dart';
import 'package:route_smart/features/checkout/domain/entites/shipping_address_entity.dart';
import 'package:route_smart/features/checkout/domain/repo/checkout_repository.dart';
import 'package:route_smart/features/checkout/domain/repo/stripe_repository.dart';

class GetAddressesUseCase {
  final CheckoutRepository _repository;
  const GetAddressesUseCase(this._repository);

  Future<ApiResult<List<AddressEntity>>> call() => _repository.getAddresses();
}

class AddAddressUseCase {
  final CheckoutRepository _repository;
  const AddAddressUseCase(this._repository);

  Future<ApiResult<List<AddressEntity>>> call(AddressEntity address) =>
      _repository.addAddress(address);
}

class RemoveAddressUseCase {
  final CheckoutRepository _repository;
  const RemoveAddressUseCase(this._repository);

  Future<ApiResult<List<AddressEntity>>> call(String addressId) =>
      _repository.removeAddress(addressId);
}

class CreateCashOrderUseCase {
  final CheckoutRepository _repository;
  const CreateCashOrderUseCase(this._repository);

  Future<ApiResult<OrderEntity>> call({
    required String cartId,
    required ShippingAddressEntity shippingAddress,
  }) =>
      _repository.createCashOrder(
        cartId: cartId,
        shippingAddress: shippingAddress,
      );
}

class MakeStripePaymentUseCase {
  final StripeRepository _repository;
  const MakeStripePaymentUseCase(this._repository);

  Future<ApiResult<bool>> call({
    required double amount,
    String currency = 'usd',
  }) =>
      _repository.makePayment(amount: amount, currency: currency);
}
