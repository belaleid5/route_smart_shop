import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/cart/presention/manger/cart_state.dart';

class ProductAddToCartButton extends StatefulWidget {
  const ProductAddToCartButton({super.key, this.onTap, this.productId});

  final VoidCallback? onTap;
  final String? productId;

  @override
  State<ProductAddToCartButton> createState() => _ProductAddToCartButtonState();
}

class _ProductAddToCartButtonState extends State<ProductAddToCartButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController bounceController;
  late final Animation<double> bounceAnimation;

  @override
  void initState() {
    super.initState();
    bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    bounceAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: bounceController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    bounceController.dispose();
    super.dispose();
  }

  Future<void> handleTap() async {
    await bounceController.forward();
    await bounceController.reverse();
    widget.onTap?.call();
  }

  bool isProductInCart(CartState state) {
    if (widget.productId == null || widget.productId!.isEmpty) return false;

    return state.maybeWhen(
      getCartSuccess: (cart) =>
          cart.data?.products.any(
            (item) => item.productId == widget.productId,
          ) ??
          false,
      addToCartSuccess: (cart) =>
          cart.data?.products.any(
            (item) => item.productId == widget.productId,
          ) ??
          false,
      removeItemSuccess: (cart) =>
          cart.data?.products.any(
            (item) => item.productId == widget.productId,
          ) ??
          false,
      orElse: () => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.productId == null || widget.productId!.isEmpty) {
      return buildButton(context, isInCart: false, onTap: widget.onTap);
    }

    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          isProductInCart(previous) != isProductInCart(current),
      builder: (context, state) => ScaleTransition(
        scale: bounceAnimation,
        child: buildButton(
          context,
          isInCart: isProductInCart(state),
          onTap: handleTap,
        ),
      ),
    );
  }

  Widget buildButton(
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
          color: context.color.primary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: context.color.black.withOpacity(0.08),
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
    );
  }
}