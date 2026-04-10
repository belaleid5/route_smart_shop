// lib/features/wishlist/presentation/widgets/wishlist_avatar.dart

import 'package:flutter/material.dart';

class WishlistAvatar extends StatelessWidget {
  const WishlistAvatar({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFF0F0F0), width: 2),
      ),
      child: ClipOval(child: Image.network(imageUrl, fit: BoxFit.cover)),
    );
  }
}
