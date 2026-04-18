// lib/features/wishlist/presentation/widgets/wishlist_recently_viewed_section.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/helper/spacing.dart';

import 'wishlist_avatar.dart';
import 'wishlist_circle_icon_button.dart';

class WishlistRecentlyViewedSection extends StatelessWidget {
  const WishlistRecentlyViewedSection({super.key});

  static const _images = [
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200',
    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200',
    'https://images.unsplash.com/photo-1526510747491-58f928ec870f?w=200',
    'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=200',
    'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=200',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Recently viewed',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              WishlistCircleIconButton(icon: Icons.arrow_forward, onTap: () {}),
            ],
          ),
          verticalSpace(12),
          SizedBox(
            height: 68,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _images.length,
              separatorBuilder: (_, __) => const SizedBox(width: 14),
              itemBuilder: (_, i) => WishlistAvatar(imageUrl: _images[i]),
            ),
          ),
          verticalSpace(16),
        ],
      ),
    );
  }
}
