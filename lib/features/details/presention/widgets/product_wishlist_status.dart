import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_state.dart';
import 'product_status_chip.dart';

class ProductWishlistStatus extends StatelessWidget {
  const ProductWishlistStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          loading: () => const StatusChip(
            label: 'Adding to Wishlist...',
            color: Colors.orange,
            icon: Icons.hourglass_empty,
          ),
          loaded: (items, wishlistIds) => const StatusChip( // ✅ إضافة parameter تاني
            label: '✅ Added to Wishlist',
            color: Colors.green,
            icon: Icons.favorite,
          ),
          error: (msg) => StatusChip(
            label: '❌ $msg',
            color: Colors.red,
            icon: Icons.error_outline,
          ),
        );
      },
    );
  }
}