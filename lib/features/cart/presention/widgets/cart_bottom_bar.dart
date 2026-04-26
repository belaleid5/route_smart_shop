import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/di/di.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/cart/presention/widgets/total_price_column.dart';
import 'package:route_smart/features/checkout/presention/manger/checkout_bloc.dart';
import 'package:route_smart/features/checkout/presention/manger/checkout_event.dart';
import 'package:route_smart/features/checkout/presention/pages/checkout_page.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({super.key, required this.totalPrice});

  final double totalPrice;

  void _navigateToCheckout(BuildContext context) {
    final cartBloc = context.read<CartBloc>();
    final cart = cartBloc.currentCart();

    if (cart == null || (cart.data?.products.isEmpty ?? true)) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => sl<CheckoutBloc>()
            ..add(const CheckoutEvent.getAddresses()),
          child: CheckoutPage(
            cartId: cart.cartId ?? '',
            cartItems: cart.data?.products ?? [],
            totalPrice: cart.data?.totalPrice ?? 0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: context.color.shades,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 20,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: Row(
        children: [
          TotalPriceColumn(totalPrice: totalPrice),
          const SizedBox(width: 16),
          Expanded(
            child: _CheckoutNavButton(
              onTap: () => _navigateToCheckout(context),
            ),
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
        icon: const Icon(
          Icons.lock_outline_rounded,
          color: Colors.white,
          size: 18,
        ),
        label: Text(
          'Checkout',
          style: context.textStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: context.color.button,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}