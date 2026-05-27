import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/cart_extenions.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/cart/presention/manger/cart_state.dart';

class ProductDetailsBottomBar extends StatelessWidget {
  const ProductDetailsBottomBar({
    super.key,
    required this.price,
    required this.productId,
    required this.onAddToCart,
  });

  final double price;
  final String productId;
  final VoidCallback onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        16,
        20,
        MediaQuery.of(context).padding.bottom + 16,
      ),
      decoration: BoxDecoration(
        color: context.colors.shades,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.translate(LangKeys.price),
                style: context.textStyle.copyWith(
                  fontSize: 12,
                  color: context.colors.textPrimary.withValues(alpha: 0.5),
                ),
              ),
              Text(
                '\$${price.toStringAsFixed(2)}',
                style: context.textStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: context.colors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: BlocBuilder<CartBloc, CartState>(
              buildWhen: (previous, current) {
                final wasInCart = previous.isProductInCart(productId);
                final isInCart = current.isProductInCart(productId);
                return wasInCart != isInCart;
              },
              builder: (context, state) {
                final isInCart = state.isProductInCart(productId);

                return SizedBox(
                  height: 54,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) =>
                        FadeTransition(opacity: animation, child: child),
                    child: isInCart
                        ? _buildInCartButton(context)
                        : _buildAddToCartButton(context),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddToCartButton(BuildContext context) {
    return SizedBox(
      key: const ValueKey('add'),
      width: double.infinity,
      height: 54,
      child: ElevatedButton.icon(
        onPressed: onAddToCart,
        icon: const Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white,
          size: 20,
        ),
        label: Text(
          context.translate(LangKeys.addToCart),
          style: context.textStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: context.colors.button,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget _buildInCartButton(BuildContext context) {
    return SizedBox(
      key: const ValueKey('inCart'),
      width: double.infinity,
      height: 54,
      child: ElevatedButton.icon(
        onPressed: null,
        icon: const Icon(Icons.check_rounded, color: Colors.white, size: 20),
        label: Text(
          context.translate(LangKeys.productAlreadyInCart),
          style: context.textStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: context.colors.button.withValues(alpha: 0.6),
          disabledBackgroundColor: context.colors.button.withValues(alpha: 0.6),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
