import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_toast.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/cart/data/models/cart_response_model.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/cart/presention/manger/cart_event.dart';
import 'package:route_smart/features/cart/presention/manger/cart_state.dart';

extension CartContext on BuildContext {
  void toggleCart(String productId) {
    if (productId.isEmpty) return;

    final cartBloc = read<CartBloc>();
    final isInCart = cartBloc.state.isProductInCart(productId);

    if (isInCart) {
      cartBloc.add(CartEvent.removeItem(productId));
      CustomToast.showSuccess(
        this,
        translate(LangKeys.itemRemoved),
      );
    } else {
      cartBloc.add(CartEvent.addToCart(productId));
      CustomToast.showSuccess(
        this,
        translate(LangKeys.productAddedToCart),
      );
    }
  }

  /// إضافة للسلة مع تحقق من الوجود المسبق
  void addToCartSafe(String productId) {
    if (productId.isEmpty) return;

    final cartBloc = read<CartBloc>();
    final isInCart = cartBloc.state.isProductInCart(productId);

    if (isInCart) {
      CustomToast.showError(
        this,
        translate(LangKeys.productAlreadyInCart),
      );
      return;
    }

    cartBloc.add(CartEvent.addToCart(productId));
    CustomToast.showSuccess(
      this,
      translate(LangKeys.productAddedToCart),
    );
  }
}

extension CartStateX on CartState {
  bool isProductInCart(String productId) {
    bool checkInCart(CartResponseModel cart) {
      return cart.data?.products.any((p) => p.productId == productId) ?? false;
    }

    return maybeWhen(
      getCartSuccess: checkInCart,
      addToCartSuccess: checkInCart,
      updateQuantitySuccess: checkInCart,
      removeItemSuccess: checkInCart,
      orElse: () => false,
    );
  }
}