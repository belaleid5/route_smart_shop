import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/features/checkout/domain/usecase/checkout_usecases.dart';
import 'package:route_smart/features/checkout/presention/manger/checkout_event.dart';
import 'package:route_smart/features/checkout/presention/manger/checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final GetAddressesUseCase _getAddresses;
  final AddAddressUseCase _addAddress;
  final RemoveAddressUseCase _removeAddress;
  final CreateCashOrderUseCase _createCashOrder;
  final MakeStripePaymentUseCase _makeStripePayment;

  static const _fallbackError = 'Something went wrong. Please try again';

  CheckoutBloc({
    required GetAddressesUseCase getAddresses,
    required AddAddressUseCase addAddress,
    required RemoveAddressUseCase removeAddress,
    required CreateCashOrderUseCase createCashOrder,
    required MakeStripePaymentUseCase makeStripePayment,
  })  : _getAddresses = getAddresses,
        _addAddress = addAddress,
        _removeAddress = removeAddress,
        _createCashOrder = createCashOrder,
        _makeStripePayment = makeStripePayment,
        super(const CheckoutInitial()) {
    on<GetAddressesEvent>(_onGetAddresses);
    on<AddAddressEvent>(_onAddAddress);
    on<RemoveAddressEvent>(_onRemoveAddress);
    on<CreateCashOrderEvent>(_onCreateCashOrder);
    on<PayWithCardEvent>(_onPayWithCard);
  }

  String _safe(String? e) {
    debugPrint('🔴 CheckoutBloc error: $e');
    return (e != null && e.isNotEmpty) ? e : _fallbackError;
  }

  Future<void> _onGetAddresses(
    GetAddressesEvent event,
    Emitter<CheckoutState> emit,
  ) async {
    emit(const CheckoutLoading());
    try {
      final result = await _getAddresses();
      result.when(
        success: (addresses) {
          debugPrint('✅ getAddresses: ${addresses.length} addresses');
          emit(CheckoutAddressesLoaded(addresses));
        },
        failure: (error) => emit(CheckoutError(_safe(error))),
      );
    } catch (e, st) {
      debugPrint('🔴 getAddresses exception: $e\n$st');
      emit(CheckoutError(_safe(e.toString())));
    }
  }

  Future<void> _onAddAddress(
    AddAddressEvent event,
    Emitter<CheckoutState> emit,
  ) async {
    emit(const CheckoutLoading());
    try {
      final result = await _addAddress(event.address);
      result.when(
        success: (addresses) => emit(CheckoutAddressesLoaded(addresses)),
        failure: (error) => emit(CheckoutError(_safe(error))),
      );
    } catch (e, st) {
      debugPrint('🔴 addAddress exception: $e\n$st');
      emit(CheckoutError(_safe(e.toString())));
    }
  }

  Future<void> _onRemoveAddress(
    RemoveAddressEvent event,
    Emitter<CheckoutState> emit,
  ) async {
    emit(const CheckoutLoading());
    try {
      final result = await _removeAddress(event.addressId);
      result.when(
        success: (addresses) => emit(CheckoutAddressesLoaded(addresses)),
        failure: (error) => emit(CheckoutError(_safe(error))),
      );
    } catch (e, st) {
      debugPrint('🔴 removeAddress exception: $e\n$st');
      emit(CheckoutError(_safe(e.toString())));
    }
  }

  Future<void> _onCreateCashOrder(
    CreateCashOrderEvent event,
    Emitter<CheckoutState> emit,
  ) async {
    emit(const CheckoutLoading());
    try {
      final result = await _createCashOrder(
        cartId: event.cartId,
        shippingAddress: event.shippingAddress,
      );
      result.when(
        success: (order) {
          debugPrint('✅ createCashOrder: ${order.id}');
          emit(CheckoutOrderCreated(order));
        },
        failure: (error) => emit(CheckoutError(_safe(error))),
      );
    } catch (e, st) {
      debugPrint('🔴 createCashOrder exception: $e\n$st');
      emit(CheckoutError(_safe(e.toString())));
    }
  }

  Future<void> _onPayWithCard(
    PayWithCardEvent event,
    Emitter<CheckoutState> emit,
  ) async {
    emit(const CheckoutProcessingPayment());
    try {
      debugPrint('💳 Starting Stripe payment: amount=${event.amount}, currency=${event.currency}');

      // Step 1: Stripe payment
      final paymentResult = await _makeStripePayment(
        amount: event.amount,
        currency: event.currency,
      );

      final paymentSucceeded = paymentResult.when(
        success: (_) {
          debugPrint('✅ Stripe payment succeeded');
          return true;
        },
        failure: (error) {
          debugPrint('🔴 Stripe payment failed: $error');
          emit(CheckoutError(_safe(error)));
          return false;
        },
      );

      if (!paymentSucceeded) return;

      // Step 2: Create order
      debugPrint('📦 Creating order after payment...');
      final orderResult = await _createCashOrder(
        cartId: event.cartId,
        shippingAddress: event.shippingAddress,
      );

      orderResult.when(
        success: (order) {
          debugPrint('✅ Order created: ${order.id}');
          emit(CheckoutOrderCreated(order));
          emit(const CheckoutPaymentSuccess());
        },
        failure: (error) => emit(CheckoutError(_safe(error))),
      );
    } catch (e, st) {
      debugPrint('🔴 payWithCard exception: $e\n$st');
      emit(CheckoutError(_safe(e.toString())));
    }
  }
}