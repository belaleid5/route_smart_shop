import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:route_smart/features/checkout/data/models/address_response_model.dart';
import 'package:route_smart/features/checkout/data/models/order_response_model.dart';

part 'checkout_state.freezed.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState.initial() = _Initial;

  const factory CheckoutState.loading() = _Loading;

  const factory CheckoutState.addressesLoaded(List<AddressModel> addresses) =
      _AddressesLoaded;

  const factory CheckoutState.orderCreated(OrderResponseModel order) =
      _OrderCreated;

  const factory CheckoutState.processingPayment() = _ProcessingPayment;

  const factory CheckoutState.paymentSuccess() = _PaymentSuccess;

  const factory CheckoutState.error(String message) = _Error;
}