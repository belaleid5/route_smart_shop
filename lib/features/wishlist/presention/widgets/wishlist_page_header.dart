// lib/features/wishlist/presentation/widgets/wishlist_page_header.dart

import 'package:flutter/material.dart';

class WishlistPageHeader extends StatelessWidget {
  const WishlistPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Text(
        'Wishlist',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          color: Colors.black,
        ),
      ),
    );
  }
}
