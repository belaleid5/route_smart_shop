import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/cart/data/models/cart_data_model.dart';
import 'package:route_smart/features/cart/data/models/cart_item_model.dart';
import 'package:route_smart/features/cart/data/models/cart_response_model.dart';
import 'package:route_smart/features/cart/data/repo/cart_repo.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepositoryImpl repository;
  final Set<String> processingProductIds = {};

  static const _fallbackError = 'Something went wrong. Please try again';

  CartBloc(this.repository) : super(const CartState.initial()) {
    on<GetCartEvent>(onGetCart);
    on<AddToCartEvent>(onAddToCart);
    on<UpdateQuantityEvent>(onUpdateQuantity);
    on<RemoveItemEvent>(onRemoveItem);
    on<ClearCartEvent>(onClearCart);
  }

  String _safeError(String? error) =>
      (error != null && error.isNotEmpty) ? error : _fallbackError;

  CartResponseModel? currentCart() => state.maybeWhen(
        getCartSuccess: (cart) => cart,
        addToCartSuccess: (cart) => cart,
        updateQuantitySuccess: (cart) => cart,
        removeItemSuccess: (cart) => cart,
        orElse: () => null,
      );

  CartResponseModel buildOptimisticCart(
    CartResponseModel current,
    List<CartItemModel> updatedProducts,
  ) {
    final newTotal = updatedProducts.fold<double>(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );

    return CartResponseModel(
      status: current.status,
      itemCount: updatedProducts.length,
      cartId: current.cartId,
      message: current.message,
      data: CartDataModel(
        products: updatedProducts,
        totalPrice: newTotal,
      ),
    );
  }

  Future<void> onGetCart(
    GetCartEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartState.loading());

    final result = await repository.getCart();

    result.when(
      success: (cart) => emit(CartState.getCartSuccess(cart)),
      failure: (error) => emit(CartState.error(_safeError(error))),
    );
  }

  Future<void> onAddToCart(
    AddToCartEvent event,
    Emitter<CartState> emit,
  ) async {
    if (processingProductIds.contains(event.productId)) return;
    processingProductIds.add(event.productId);

    try {
      final result = await repository.addToCart(event.productId);

      result.when(
        success: (cart) => emit(CartState.addToCartSuccess(cart)),
        failure: (error) => emit(CartState.error(_safeError(error))),
      );
    } finally {
      processingProductIds.remove(event.productId);
    }
  }

  Future<void> onUpdateQuantity(
    UpdateQuantityEvent event,
    Emitter<CartState> emit,
  ) async {
    if (processingProductIds.contains(event.productId)) return;
    processingProductIds.add(event.productId);

    final previousCart = currentCart();

    if (previousCart != null) {
      final optimisticProducts = previousCart.data?.products
              .map(
                (item) => item.productId == event.productId
                    ? item.copyWith(quantity: event.count)
                    : item,
              )
              .toList() ??
          [];

      emit(CartState.updateQuantitySuccess(
        buildOptimisticCart(previousCart, optimisticProducts),
      ));
    }

    try {
      final result = await repository.updateCartItemQuantity(
        event.productId,
        event.count,
      );

      result.when(
        success: (cart) => emit(CartState.updateQuantitySuccess(cart)),
        failure: (error) {
          if (previousCart != null) {
            emit(CartState.updateQuantitySuccess(previousCart));
          }
          emit(CartState.error(_safeError(error)));
        },
      );
    } finally {
      processingProductIds.remove(event.productId);
    }
  }

  Future<void> onRemoveItem(
    RemoveItemEvent event,
    Emitter<CartState> emit,
  ) async {
    if (processingProductIds.contains(event.productId)) return;
    processingProductIds.add(event.productId);

    final previousCart = currentCart();

    // ✅ Optimistic update — استخدم updateQuantitySuccess
    // علشان الـ CartBody listener مايعرضش Toast هنا
    if (previousCart != null) {
      final optimisticProducts = previousCart.data?.products
              .where((item) => item.productId != event.productId)
              .toList() ??
          [];

      emit(CartState.updateQuantitySuccess(
        buildOptimisticCart(previousCart, optimisticProducts),
      ));
    }

    try {
      final result = await repository.removeCartItem(event.productId);

      result.when(
        // ✅ Toast يظهر هنا فقط — مرة واحدة
        success: (cart) => emit(CartState.removeItemSuccess(cart)),
        failure: (error) {
          if (previousCart != null) {
            emit(CartState.updateQuantitySuccess(previousCart));
          }
          emit(CartState.error(_safeError(error)));
        },
      );
    } finally {
      processingProductIds.remove(event.productId);
    }
  }

  Future<void> onClearCart(
    ClearCartEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartState.loading());

    final result = await repository.clearCart();

    result.when(
      success: (message) => emit(CartState.clearCartSuccess(message)),
      failure: (error) => emit(CartState.error(_safeError(error))),
    );
  }

  bool isProductInCart(String productId) {
    return state.maybeWhen(
      getCartSuccess: (cart) =>
          cart.data?.products.any((item) => item.productId == productId) ??
          false,
      addToCartSuccess: (cart) =>
          cart.data?.products.any((item) => item.productId == productId) ??
          false,
      removeItemSuccess: (cart) =>
          cart.data?.products.any((item) => item.productId == productId) ??
          false,
      updateQuantitySuccess: (cart) =>
          cart.data?.products.any((item) => item.productId == productId) ??
          false,
      orElse: () => false,
    );
  }
}