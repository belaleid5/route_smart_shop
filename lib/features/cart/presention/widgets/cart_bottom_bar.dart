import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/core/routes/routes_names.dart';
import 'package:route_smart/features/cart/domain/entites/checkout_args.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/cart/presention/widgets/total_price_column.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({super.key, required this.totalPrice});

  final double totalPrice;

  void _navigateToCheckout(BuildContext context) {
    final cart = context.read<CartBloc>().currentCart();

    if (cart == null || cart.items.isEmpty) return;

    context.pushNamed(
      AppRoutesNames.checkout,
      arguments: CheckoutRouteArgs(
        cartId: cart.id,
        cartItems: cart.items,
        totalPrice: cart.totalPrice,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        boxShadow: [
          BoxShadow(
            color: context.colors.textPrimary.withValues(alpha: 0.07),
            blurRadius: 20,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: Row(
        children: [
          TotalPriceColumn(totalPrice: totalPrice),
          horizontalSpace(16),
          Expanded(
            child: _CheckoutNavButton(onTap: () => _navigateToCheckout(context)),
          ),
        ],
      ),
    );
  }
}

class _CheckoutNavButton extends StatelessWidget {
  const _CheckoutNavButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(Icons.lock_outline_rounded, color: context.colors.white, size: 18),
        label: Text(
          context.translate(LangKeys.checkout),
          style: context.titleMedium.copyWith(color: context.colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: context.colors.button,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}