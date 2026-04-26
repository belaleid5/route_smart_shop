import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_toast.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/cart/presention/manger/cart_event.dart';
import 'package:route_smart/features/cart/presention/manger/cart_state.dart';
import 'package:route_smart/features/cart/presention/widgets/cart_content.dart';
import 'package:route_smart/features/cart/presention/widgets/cart_error_view.dart';
import 'package:route_smart/features/cart/presention/widgets/cart_shimmer.dart';
import 'package:route_smart/features/cart/presention/widgets/empty_cart_view.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  bool _hasLoadedOnce = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listenWhen: (previous, current) {
        // لو الحالة السابقة كانت removeItemSuccess والحالية كمان → تجاهل
        final wasRemove = previous.maybeWhen(
          removeItemSuccess: (_) => true,
          orElse: () => false,
        );
        final isRemove = current.maybeWhen(
          removeItemSuccess: (_) => true,
          orElse: () => false,
        );
        if (wasRemove && isRemove) return false;

        return current.maybeWhen(
          removeItemSuccess: (_) => true,
          clearCartSuccess: (_) => true,
          orElse: () => false,
        );
      },
      listener: (context, state) {
        state.maybeWhen(
          getCartSuccess: (_) => _hasLoadedOnce = true,
          addToCartSuccess: (_) => _hasLoadedOnce = true,
          removeItemSuccess: (_) {
            _hasLoadedOnce = true;
            CustomToast.showSuccess(
              context,
              context.translate(LangKeys.itemRemoved),
            );
          },
          updateQuantitySuccess: (_) => _hasLoadedOnce = true,
          clearCartSuccess: (_) => CustomToast.showSuccess(
            context,
            context.translate(LangKeys.cartCleared),
          ),
          orElse: () {},
        );
      },
      buildWhen: (previous, current) {
        if (_hasLoadedOnce && current == const CartState.loading()) {
          return false;
        }
        return true;
      },
      builder: (context, state) => state.when(
        initial: () => const CartShimmerLoading(),
        loading: () => const CartShimmerLoading(),
        getCartSuccess: (cart) => CartContent(cart: cart),
        addToCartSuccess: (cart) => CartContent(cart: cart),
        updateQuantitySuccess: (cart) => CartContent(cart: cart),
        removeItemSuccess: (cart) => CartContent(cart: cart),
        clearCartSuccess: (_) => const EmptyCartView(),
        error: (message) => CartErrorView(
          message: message,
          onRetry: () =>
              context.read<CartBloc>().add(const CartEvent.getCart()),
        ),
      ),
    );
  }
}