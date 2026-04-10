// lib/features/wishlist/presentation/widgets/wishlist_bottom_nav.dart

import 'package:flutter/material.dart';

class WishlistBottomNav extends StatelessWidget {
  const WishlistBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFF2563EB),
      unselectedItemColor: Colors.grey,
      currentIndex: 1,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, size: 28),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite, size: 28),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.description_outlined, size: 28),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined, size: 28),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline, size: 28),
          label: '',
        ),
      ],
    );
  }
}
