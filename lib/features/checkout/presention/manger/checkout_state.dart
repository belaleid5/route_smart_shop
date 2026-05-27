import 'package:route_smart/features/checkout/domain/entites/address_entity.dart';
import 'package:route_smart/features/checkout/domain/entites/order_entity.dart';


sealed class CheckoutState {
  const CheckoutState();
}

final class CheckoutInitial extends CheckoutState {
  const CheckoutInitial();
}

final class CheckoutLoading extends CheckoutState {
  const CheckoutLoading();
}

final class CheckoutAddressesLoaded extends CheckoutState {
  final List<AddressEntity> addresses;
  const CheckoutAddressesLoaded(this.addresses);
}

final class CheckoutOrderCreated extends CheckoutState {
  final OrderEntity order;
  const CheckoutOrderCreated(this.order);
}

final class CheckoutProcessingPayment extends CheckoutState {
  const CheckoutProcessingPayment();
}

final class CheckoutPaymentSuccess extends CheckoutState {
  const CheckoutPaymentSuccess();
}

final class CheckoutError extends CheckoutState {
  final String message;
  const CheckoutError(this.message);
}
