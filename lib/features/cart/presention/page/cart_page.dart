import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_toast.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/cart/presention/manger/cart_event.dart';
import 'package:route_smart/features/cart/presention/manger/cart_state.dart';
import 'package:route_smart/features/cart/presention/widgets/cart_content.dart';
import 'package:route_smart/features/cart/presention/widgets/cart_error_view.dart';
import 'package:route_smart/features/cart/presention/widgets/empty_cart_view.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.background,
      body: BlocConsumer<CartBloc, CartState>(
        listenWhen: (previous, current) => current.maybeWhen(
          removeItemSuccess: (_) => true,
          clearCartSuccess: (_) => true,
          updateQuantitySuccess: (_) => true,
          error: (_) => true,
          orElse: () => false,
        ),
        listener: (context, state) => state.maybeWhen(
          removeItemSuccess: (_) => CustomToast.showSuccess(
            context,
            context.translate('item_removed'),
          ),
          clearCartSuccess: (_) => CustomToast.showSuccess(
            context,
            context.translate('cart_cleared'),
          ),
          updateQuantitySuccess: (_) => CustomToast.showSuccess(
            context,
            context.translate('quantity_updated'),
          ),
          error: (message) => CustomToast.showError(context, message),
          orElse: () {
            return null;
          },
        ),
        builder: (context, state) => state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          getCartSuccess: (cart) => CartContent(cart: cart),
          addToCartSuccess: (cart) => CartContent(cart: cart),
          updateQuantitySuccess: (cart) => CartContent(cart: cart),
          removeItemSuccess: (cart) => CartContent(cart: cart),
          clearCartSuccess: (_) => const EmptyCartView(),
          error: (message) => CartErrorView(
            message: message,
            onRetry: () => context.read<CartBloc>().add(
                  const CartEvent.getCart(),
                ),
          ),
        ),
      ),
    );
  }
}

