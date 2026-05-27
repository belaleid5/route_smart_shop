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

  bool _isSuccessState(CartState state) {
    return state is GetCartSuccess ||
        state is AddToCartSuccess ||
        state is UpdateQuantitySuccess ||
        state is RemoveItemSuccess ||
        state is ClearCartSuccess;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listenWhen: (previous, current) {
        final isDuplicateRemove =
            previous is RemoveItemSuccess && current is RemoveItemSuccess;

        if (isDuplicateRemove) return false;

        return _isSuccessState(current);
      },
      listener: (context, state) {
        switch (state) {
          case GetCartSuccess():
          case AddToCartSuccess():
          case UpdateQuantitySuccess():
            _hasLoadedOnce = true;
            break;

          case RemoveItemSuccess():
            _hasLoadedOnce = true;
            CustomToast.showSuccess(
              context,
              context.translate(LangKeys.itemRemoved),
            );
            break;

          case ClearCartSuccess():
            _hasLoadedOnce = true;
            CustomToast.showSuccess(
              context,
              context.translate(LangKeys.cartCleared),
            );
            break;

          default:
            break;
        }
      },
      buildWhen: (previous, current) {
        if (_hasLoadedOnce && current is GetCartLoading) {
          return false;
        }
        return true;
      },
      builder: (context, state) {
        return switch (state) {
          CartInitial() || GetCartLoading() => const CartShimmerLoading(),

          GetCartSuccess(:final cart) ||
          AddToCartSuccess(:final cart) ||
          UpdateQuantitySuccess(:final cart) ||
          RemoveItemSuccess(:final cart) =>
            (cart.items.isEmpty)
                ? const EmptyCartView()
                : CartContent(cart: cart),

          ClearCartSuccess() => const EmptyCartView(),

          CartFailure(:final message) => CartErrorView(
              message: context.translate(message),
              onRetry: () {
                context.read<CartBloc>().add(const GetCartRequested());
              },
            ),
        };
      },
    );
  }
}