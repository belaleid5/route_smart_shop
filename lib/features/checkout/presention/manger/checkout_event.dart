import 'package:route_smart/features/checkout/domain/entites/address_entity.dart';
import 'package:route_smart/features/checkout/domain/entites/shipping_address_entity.dart';

sealed class CheckoutEvent {
  const CheckoutEvent();
}

final class GetAddressesEvent extends CheckoutEvent {
  const GetAddressesEvent();
}

final class AddAddressEvent extends CheckoutEvent {
  final AddressEntity address;
  const AddAddressEvent(this.address);
}

final class RemoveAddressEvent extends CheckoutEvent {
  final String addressId;
  const RemoveAddressEvent(this.addressId);
}

final class CreateCashOrderEvent extends CheckoutEvent {
  final String cartId;
  final ShippingAddressEntity shippingAddress;

  const CreateCashOrderEvent({
    required this.cartId,
    required this.shippingAddress,
  });
}

final class PayWithCardEvent extends CheckoutEvent {
  final double amount;
  final String cartId;
  final ShippingAddressEntity shippingAddress;
  final String currency;

  const PayWithCardEvent({
    required this.amount,
    required this.cartId,
    required this.shippingAddress,
    this.currency = 'usd',
  });
}
