// features/cart/presention/manger/cart_state.dart

import 'package:route_smart/features/cart/domain/entites/cart_entity.dart';

sealed class CartState {
  const CartState();

  const factory CartState.initial() = CartInitial;
  const factory CartState.loading() = GetCartLoading;
  const factory CartState.getCartSuccess(CartEntity cart) = GetCartSuccess;
  const factory CartState.addToCartSuccess(CartEntity cart) = AddToCartSuccess;
  const factory CartState.updateQuantitySuccess(CartEntity cart) = UpdateQuantitySuccess;
  const factory CartState.removeItemSuccess(CartEntity cart) = RemoveItemSuccess;
  const factory CartState.clearCartSuccess(CartEntity cart) = ClearCartSuccess;
  const factory CartState.error(String message) = CartFailure;
}

final class CartInitial extends CartState {
  const CartInitial();
}

final class GetCartLoading extends CartState {
  const GetCartLoading();
}

final class GetCartSuccess extends CartState {
  const GetCartSuccess(this.cart);
  final CartEntity cart;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetCartSuccess && runtimeType == other.runtimeType && cart == other.cart;

  @override
  int get hashCode => cart.hashCode;
}

final class AddToCartSuccess extends CartState {
  const AddToCartSuccess(this.cart);
  final CartEntity cart;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddToCartSuccess && runtimeType == other.runtimeType && cart == other.cart;

  @override
  int get hashCode => cart.hashCode;
}

final class UpdateQuantitySuccess extends CartState {
  const UpdateQuantitySuccess(this.cart);
  final CartEntity cart;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateQuantitySuccess && runtimeType == other.runtimeType && cart == other.cart;

  @override
  int get hashCode => cart.hashCode;
}

final class RemoveItemSuccess extends CartState {
  const RemoveItemSuccess(this.cart);
  final CartEntity cart;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RemoveItemSuccess && runtimeType == other.runtimeType && cart == other.cart;

  @override
  int get hashCode => cart.hashCode;
}

final class ClearCartSuccess extends CartState {
  const ClearCartSuccess(this.cart);
  final CartEntity cart;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClearCartSuccess && runtimeType == other.runtimeType && cart == other.cart;

  @override
  int get hashCode => cart.hashCode;
}

final class CartFailure extends CartState {
  const CartFailure(this.message);
  final String message;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartFailure && runtimeType == other.runtimeType && message == other.message;

  @override
  int get hashCode => message.hashCode;
}


