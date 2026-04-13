import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/cart/presention/manger/cart_event.dart';
import 'package:route_smart/features/cart/presention/widgets/cart_count_badge.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key, required this.itemCount});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 56, 16, 16),
      child: Row(
        children: [
          Text(
            context.translate('cart'),
            style: context.textStyle.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: context.color.textPrimary,
            ),
          ),
          const SizedBox(width: 12),
          CartCountBadge(count: itemCount),
          const Spacer(),
          TextButton(
            onPressed: () => context.read<CartBloc>().add(
                  const CartEvent.clearCart(),
                ),
            child: Text(
              context.translate('clear_all'),
              style: context.textStyle.copyWith(
                fontSize: 14,
                color: Colors.red[400],
              ),
            ),
          ),
        ],
      ),
    );
  }
}