import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_toast.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/cart/presention/manger/cart_event.dart';
import 'package:route_smart/features/cart/presention/manger/cart_state.dart';

extension CartStateExtension on CartState {
  bool isProductInCart(String productId) {
    return switch (this) {
      GetCartSuccess(:final cart) ||
      AddToCartSuccess(:final cart) ||
      UpdateQuantitySuccess(:final cart) ||
      RemoveItemSuccess(:final cart) ||
      ClearCartSuccess(:final cart) =>
        cart.items.any((item) => item.productId == productId),
      _ => false,
    };
  }
}

extension CartContext on BuildContext {
  void addToCart(String productId) {
    if (productId.isEmpty) return;

    final cartBloc = read<CartBloc>();
    final isInCart = cartBloc.state.isProductInCart(productId);

    if (isInCart) {
      CustomToast.showInfo(this, translate(LangKeys.productAlreadyInCart));
    } else {
      cartBloc.add(AddToCartRequested(productId: productId));
      CustomToast.showSuccess(this, translate(LangKeys.productAddedToCart));
    }
  }
}