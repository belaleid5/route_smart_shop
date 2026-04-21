import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:route_smart/features/checkout/data/models/address_response_model.dart';
import 'package:route_smart/features/checkout/data/models/shipping_address_model.dart';

part 'checkout_event.freezed.dart';

@freezed
class CheckoutEvent with _$CheckoutEvent {
  const factory CheckoutEvent.getAddresses() = GetAddressesEvent;

  const factory CheckoutEvent.addAddress(AddressModel address) = AddAddressEvent;

  const factory CheckoutEvent.removeAddress(String addressId) = RemoveAddressEvent;

  const factory CheckoutEvent.createCashOrder({
    required String cartId,
    required ShippingAddressModel shippingAddress,
  }) = CreateCashOrderEvent;

  const factory CheckoutEvent.payWithCard({
    required double amount,
    required String cartId,
    required ShippingAddressModel shippingAddress,
  }) = PayWithCardEvent;
}