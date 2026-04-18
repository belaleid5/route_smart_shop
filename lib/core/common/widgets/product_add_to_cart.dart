import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/cart/data/models/cart_response_model.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/cart/presention/manger/cart_state.dart';

class ProductAddToCartButton extends StatelessWidget {
  const ProductAddToCartButton({
    super.key,
    this.onTap,
    this.productId,
  });

  final VoidCallback? onTap;
  final String? productId;

  CartResponseModel? _extractCart(CartState state) {
    return state.whenOrNull(
      getCartSuccess: (cart) => cart,
      addToCartSuccess: (cart) => cart,
      removeItemSuccess: (cart) => cart,
      updateQuantitySuccess: (cart) => cart,
    );
  }

  bool _isProductInCart(CartState state) {
    if (productId == null || productId!.isEmpty) return false;

    final cart = _extractCart(state);
    if (cart == null) return false;

    return cart.data?.products.any(
          (item) => item.productId == productId,
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    if (productId == null || productId!.isEmpty) {
      return _buildButton(context, isInCart: false, onTap: onTap);
    }

    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) {
        final wasInCart = _isProductInCart(previous);
        final isInCart = _isProductInCart(current);
        return wasInCart != isInCart;
      },
      builder: (context, state) {
        final isInCart = _isProductInCart(state);

        return _buildButton(
          context,
          isInCart: isInCart,
          onTap: isInCart ? null : onTap,
        );
      },
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required bool isInCart,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: isInCart
              ? context.color.primary.withValues(alpha: 0.6)
              : context.color.primary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: context.color.black.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: FadeTransition(opacity: animation, child: child),
          ),
          child: Icon(
            isInCart ? Icons.check : Icons.shopping_cart_rounded,
            key: ValueKey(isInCart),
            size: 18,
            color: context.color.white,
          ),
        ),
      ),
    )
        .animate(target: isInCart ? 1 : 0)
        .scale(
          begin: const Offset(1.0, 1.0),
          end: const Offset(1.2, 1.2),
          duration: 150.ms,
          curve: Curves.easeOut,
        )
        .then()
        .scale(
          begin: const Offset(1.2, 1.2),
          end: const Offset(1.0, 1.0),
          duration: 150.ms,
          curve: Curves.easeIn,
        );
  }
}