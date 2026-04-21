import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/checkout/data/repo/checkout_repo.dart';
import 'package:route_smart/features/checkout/data/repo/stripe_repo.dart';

import 'checkout_event.dart';
import 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CheckoutRepository _repository;
  final StripeRepository _stripeRepo;

  static const _fallbackError = 'Something went wrong. Please try again';

  CheckoutBloc(this._repository, this._stripeRepo)
    : super(const CheckoutState.initial()) {
    on<GetAddressesEvent>(_onGetAddresses);
    on<AddAddressEvent>(_onAddAddress);
    on<RemoveAddressEvent>(_onRemoveAddress);
    on<CreateCashOrderEvent>(_onCreateCashOrder);
    on<PayWithCardEvent>(_onPayWithCard);
  }

  String _safeError(String? error) =>
      (error != null && error.isNotEmpty) ? error : _fallbackError;

  Future<void> _onGetAddresses(
    GetAddressesEvent event,
    Emitter<CheckoutState> emit,
  ) async {
    emit(const CheckoutState.loading());
    final result = await _repository.getAddresses();
    result.when(
      success: (addresses) => emit(CheckoutState.addressesLoaded(addresses)),
      failure: (error) => emit(CheckoutState.error(_safeError(error))),
    );
  }

  Future<void> _onAddAddress(
    AddAddressEvent event,
    Emitter<CheckoutState> emit,
  ) async {
    emit(const CheckoutState.loading());
    final result = await _repository.addAddress(event.address);
    result.when(
      success: (addresses) => emit(CheckoutState.addressesLoaded(addresses)),
      failure: (error) => emit(CheckoutState.error(_safeError(error))),
    );
  }

  Future<void> _onRemoveAddress(
    RemoveAddressEvent event,
    Emitter<CheckoutState> emit,
  ) async {
    emit(const CheckoutState.loading());
    final result = await _repository.removeAddress(event.addressId);
    result.when(
      success: (addresses) => emit(CheckoutState.addressesLoaded(addresses)),
      failure: (error) => emit(CheckoutState.error(_safeError(error))),
    );
  }

  Future<void> _onCreateCashOrder(
    CreateCashOrderEvent event,
    Emitter<CheckoutState> emit,
  ) async {
    emit(const CheckoutState.loading());
    final result = await _repository.createCashOrder(
      cartId: event.cartId,
      shippingAddress: event.shippingAddress,
    );
    result.when(
      success: (order) => emit(CheckoutState.orderCreated(order)),
      failure: (error) => emit(CheckoutState.error(_safeError(error))),
    );
  }

  Future<void> _onPayWithCard(
    PayWithCardEvent event,
    Emitter<CheckoutState> emit,
  ) async {
    emit(const CheckoutState.processingPayment());

    // Step 1: Pay via Stripe
    final paymentResult = await _stripeRepo.makePayment(
      amount: event.amount,
      currency: 'usd',
    );

    final paymentSucceeded = paymentResult.when(
      success: (_) => true,
      failure: (error) {
        emit(CheckoutState.error(_safeError(error)));
        return false;
      },
    );

    if (!paymentSucceeded) return;

    final orderResult = await _repository.createCashOrder(
      cartId: event.cartId,
      shippingAddress: event.shippingAddress,
    );

    orderResult.when(
      success: (order) {
        emit(CheckoutState.orderCreated(order));
        emit(const CheckoutState.paymentSuccess());
      },
      failure: (error) => emit(CheckoutState.error(_safeError(error))),
    );
  }
}
