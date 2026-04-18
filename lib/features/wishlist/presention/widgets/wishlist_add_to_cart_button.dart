import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/cart/presention/manger/cart_state.dart';
import 'package:route_smart/core/extensions/cart_extenions.dart';

class WishlistAddToCartButton extends StatelessWidget {
  const WishlistAddToCartButton({
    super.key,
    required this.onTap,
    required this.productId,
  });

  final VoidCallback onTap;
  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) {
        final wasInCart = previous.isProductInCart(productId);
        final isInCart = current.isProductInCart(productId);
        return wasInCart != isInCart;
      },
      builder: (context, state) {
        final isInCart = state.isProductInCart(productId);

        return GestureDetector(
          onTap: isInCart ? null : onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.only(top: 40),
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: isInCart
                  ? context.color.primary
                  : Colors.transparent,
              border: Border.all(
                color: context.color.primary,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeIn,
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: FadeTransition(opacity: animation, child: child),
              ),
              child: Icon(
                isInCart
                    ? Icons.check_rounded
                    : Icons.add_shopping_cart_outlined,
                key: ValueKey(isInCart),
                size: 20,
                color: isInCart
                    ? context.color.white
                    : context.color.primary,
              ),
            ),
          ),
        )
            .animate(target: isInCart ? 1 : 0)
            .scale(
              begin: const Offset(1.0, 1.0),
              end: const Offset(1.15, 1.15),
              duration: 150.ms,
              curve: Curves.easeOut,
            )
            .then()
            .scale(
              begin: const Offset(1.15, 1.15),
              end: const Offset(1.0, 1.0),
              duration: 150.ms,
              curve: Curves.easeIn,
            );
      },
    );
  }
}