import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/checkout/repo/checkout_repo.dart';
import 'checkout_event.dart';
import 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CheckoutRepository _repository;

  static const _fallbackError = 'Something went wrong. Please try again';

  CheckoutBloc(this._repository) : super(const CheckoutState.initial()) {
    on<GetAddressesEvent>(_onGetAddresses);
    on<AddAddressEvent>(_onAddAddress);
    on<RemoveAddressEvent>(_onRemoveAddress);
    on<CreateCashOrderEvent>(_onCreateCashOrder);
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
}