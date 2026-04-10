// lib/features/wishlist/presentation/widgets/wishlist_card_image.dart

import 'package:flutter/material.dart';

class WishlistCardImage extends StatelessWidget {
  const WishlistCardImage({
    super.key,
    required this.imageUrl,
    required this.onDelete,           // ← جديد
  });

  final String imageUrl;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            imageUrl,
            width: 110,
            height: 125,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              width: 110,
              height: 125,
              decoration: BoxDecoration(
                color: const Color(0xFFEEEEEE),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.image_not_supported, color: Colors.grey),
            ),
            loadingBuilder: (_, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                width: 110,
                height: 125,
                decoration: BoxDecoration(
                  color: const Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              );
            },
          ),
        ),
        Positioned(
          left: 8,
          bottom: 8,
          child: GestureDetector(
            onTap: onDelete,            // ← ربط الـ delete
            child: Container(
              width: 34,
              height: 34,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.delete_outline,
                size: 18,
                color: Color(0xFFFF5A7A),
              ),
            ),
          ),
        ),
      ],
    );
  }
}