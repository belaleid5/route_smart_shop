// lib/features/wishlist/presentation/widgets/wishlist_empty_view.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/helper/spacing.dart';

class WishlistEmptyView extends StatelessWidget {
  const WishlistEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border_rounded,
            size: 90,
            color: Colors.grey[300],
          ),
          verticalSpace(16),
          const Text(
            'Your Wishlist is Empty',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          verticalSpace(8),
          Text(
            'Save items you love\nand find them here anytime',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[500], height: 1.5),
          ),
        ],
      ),
    );
  }
}
