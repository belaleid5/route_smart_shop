import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/cart/domain/entites/cart_entity.dart';
import 'package:route_smart/features/cart/domain/entites/cart_item_entity.dart';
import 'package:route_smart/features/cart/domain/usecase/add_to_cart_use_case.dart';
import 'package:route_smart/features/cart/domain/usecase/clear_cart_use_case.dart';
import 'package:route_smart/features/cart/domain/usecase/get_cart_use_case.dart';
import 'package:route_smart/features/cart/domain/usecase/remove_cart_item_use_case.dart';
import 'package:route_smart/features/cart/domain/usecase/update_cart_item_quantity_use_case.dart';
import 'cart_event.dart';
import 'cart_state.dart';

final class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({
    required GetCartUseCase getCartUseCase,
    required AddToCartUseCase addToCartUseCase,
    required UpdateCartItemUseCase updateCartItemUseCase,
    required RemoveCartItemUseCase removeCartItemUseCase,
    required ClearCartUseCase clearCartUseCase,
  })  : _getCartUseCase = getCartUseCase,
        _addToCartUseCase = addToCartUseCase,
        _updateCartItemUseCase = updateCartItemUseCase,
        _removeCartItemUseCase = removeCartItemUseCase,
        _clearCartUseCase = clearCartUseCase,
        super(const CartState.initial()) {
    on<GetCartRequested>(_onGetCart);
    on<AddToCartRequested>(_onAddToCart);
    on<UpdateQuantityRequested>(_onUpdateQuantity);
    on<RemoveFromCartRequested>(_onRemoveItem);
    on<ClearCartRequested>(_onClearCart);
  }

  final GetCartUseCase _getCartUseCase;
  final AddToCartUseCase _addToCartUseCase;
  final UpdateCartItemUseCase _updateCartItemUseCase;
  final RemoveCartItemUseCase _removeCartItemUseCase;
  final ClearCartUseCase _clearCartUseCase;

  final Set<String> _processingProductIds = {};

  CartEntity? currentCart() {
    return switch (state) {
      GetCartSuccess(:final cart) => cart,
      AddToCartSuccess(:final cart) => cart,
      UpdateQuantitySuccess(:final cart) => cart,
      RemoveItemSuccess(:final cart) => cart,
      ClearCartSuccess(:final cart) => cart,
      _ => null,
    };
  }

  String _safeError(String? error) {
    return error != null && error.isNotEmpty ? error : LangKeys.errorDefault;
  }

  bool isProductInCart(String productId) {
    final cart = currentCart();
    if (cart == null) return false;
    return cart.items.any((item) => item.productId == productId);
  }

  // ─── Event Handlers ──────────────────────────────────────────

  Future<void> _onGetCart(GetCartRequested event, Emitter<CartState> emit) async {
    emit(const CartState.loading());
    final result = await _getCartUseCase();
    _emitCartResult(result, emit, CartState.getCartSuccess);
  }

  Future<void> _onAddToCart(AddToCartRequested event, Emitter<CartState> emit) async {
    if (_processingProductIds.contains(event.productId)) return;
    _processingProductIds.add(event.productId);

    try {
      final result = await _addToCartUseCase(
        productId: event.productId,
     
      );
      _emitCartResult(result, emit, CartState.addToCartSuccess);
    } finally {
      _processingProductIds.remove(event.productId);
    }
  }

  Future<void> _onUpdateQuantity(UpdateQuantityRequested event, Emitter<CartState> emit) async {
    if (_processingProductIds.contains(event.productId)) return;
    _processingProductIds.add(event.productId);

    final previousCart = currentCart();

    if (previousCart != null) {
      final optimisticItems = previousCart.items.map((item) {
        if (item.productId != event.productId) return item;
        return CartItemEntity(
          cartItemId: item.cartItemId,
          productId: item.productId,
          productName: item.productName,
          quantity: event.quantity,
          price: item.price,
          imageUrl: item.imageUrl,
        );
      }).toList(growable: false);

      emit(CartState.updateQuantitySuccess(
        _buildCartWithItems(current: previousCart, items: optimisticItems),
      ));
    }

    try {
      final result = await _updateCartItemUseCase(
        productId: event.productId,
        count: event.quantity,
      );

      switch (result) {
        case Success<CartEntity>(:final data):
          emit(CartState.updateQuantitySuccess(data));
        case Failure<CartEntity>(:final message):
          if (previousCart != null) {
            emit(CartState.updateQuantitySuccess(previousCart));
          }
          emit(CartState.error(_safeError(message)));
      }
    } finally {
      _processingProductIds.remove(event.productId);
    }
  }

  Future<void> _onRemoveItem(RemoveFromCartRequested event, Emitter<CartState> emit) async {
    if (_processingProductIds.contains(event.productId)) return;
    _processingProductIds.add(event.productId);

    final previousCart = currentCart();

    if (previousCart != null) {
      final optimisticItems = previousCart.items
          .where((item) => item.productId != event.productId)
          .toList(growable: false);

      emit(CartState.removeItemSuccess(
        _buildCartWithItems(current: previousCart, items: optimisticItems),
      ));
    }

    try {
      final result = await _removeCartItemUseCase(productId: event.productId);
      switch (result) {
        case Success<CartEntity>(:final data):
          emit(CartState.removeItemSuccess(data));
        case Failure<CartEntity>(:final message):
          if (previousCart != null) {
            emit(CartState.removeItemSuccess(previousCart));
          }
          emit(CartState.error(_safeError(message)));
      }
    } finally {
      _processingProductIds.remove(event.productId);
    }
  }

  Future<void> _onClearCart(ClearCartRequested event, Emitter<CartState> emit) async {
    final previousCart = currentCart();
    emit(const CartState.loading());

    final result = await _clearCartUseCase();
    switch (result) {
      case Success<bool>():
        emit(CartState.clearCartSuccess(_emptyCart(previousCart)));
      case Failure<bool>(:final message):
        emit(CartState.error(_safeError(message)));
    }
  }


  void _emitCartResult(
    ApiResult<CartEntity> result,
    Emitter<CartState> emit,
    CartState Function(CartEntity cart) onSuccess,
  ) {
    switch (result) {
      case Success<CartEntity>(:final data):
        emit(onSuccess(data));
      case Failure<CartEntity>(:final message):
        emit(CartState.error(_safeError(message)));
    }
  }

  CartEntity _buildCartWithItems({
    required CartEntity current,
    required List<CartItemEntity> items,
  }) {
    final totalPrice = items.fold<double>(0, (sum, item) => sum + (item.price * item.quantity));
    return CartEntity(
      id: current.id,
      userId: current.userId,
      items: items,
      totalPrice: totalPrice,
    );
  }

  CartEntity _emptyCart(CartEntity? current) {
    return CartEntity(
      id: current?.id ?? '',
      userId: current?.userId ?? '',
      items: const [],
      totalPrice: 0,
    );
  }
}