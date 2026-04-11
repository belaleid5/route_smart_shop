// lib/core/common/screens/main_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_glass_bottom_bar/liquid_glass_bottom_bar.dart';
import 'package:route_smart/core/di/di.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/home/presention/manger/brand/brands_bloc.dart';
import 'package:route_smart/features/home/presention/manger/brand/brands_event.dart';
import 'package:route_smart/features/home/presention/manger/categroy/categories_bloc.dart';
import 'package:route_smart/features/home/presention/manger/categroy/categories_event.dart';
import 'package:route_smart/features/home/presention/manger/product/product_bloc.dart';
import 'package:route_smart/features/home/presention/manger/product/product_event.dart';
import 'package:route_smart/features/home/presention/pages/home_screen.dart';
import 'package:route_smart/features/search/presention/manger/search_bloc.dart';
import 'package:route_smart/features/search/presention/manger/search_event.dart';
import 'package:route_smart/features/search/presention/pages/search_screen.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_event.dart';
import 'package:route_smart/features/wishlist/presention/pages/wishlist_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late final WishlistBloc _wishlistBloc;
  late final List<Widget> _pages;
  @override
  void initState() {
    super.initState();

    _wishlistBloc = sl<WishlistBloc>()
      ..add(const WishlistEvent.getWishlist());

    _pages = [
      // ── 0: Home ──────────────────────────────
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => sl<CategoriesBloc>()
              ..add(const CategoriesEvent.getCategories()),
          ),
          BlocProvider(
            create: (_) =>
                sl<BrandsBloc>()..add(const BrandsEvent.getBrands()),
          ),
          BlocProvider(
            create: (_) => sl<ProductsBloc>()
              ..add(const ProductsEvent.getProducts()),
          ),
          BlocProvider.value(value: _wishlistBloc),
        ],
        child: const HomeScreen(),
      ),

      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) =>
                sl<SearchBloc>()..add(const SearchEvent.search()),
          ),
          // ✅ BlocProvider.value - نفس الـ instance
          BlocProvider.value(value: _wishlistBloc),
        ],
        child: const SearchScreen(),
      ),

      BlocProvider.value(
        value: _wishlistBloc,
        child: const WishlistPage(),
      ),

      const Center(child: Text('Cart 🛒')),

      const Center(child: Text('Profile 👤')),
    ];
  }

  @override
  void dispose() {
    _wishlistBloc.close();
    super.dispose();
  }

  void _onTabTap(int index) {
    if (_currentIndex == index) return;
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return LiquidGlassBottomBar(
      currentIndex: _currentIndex,
      onTap: _onTabTap,
      activeColor: context.color.primary,
      barBlurSigma: 24,
      activeBlurSigma: 40,
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 16),
      items: const [
        LiquidGlassBottomBarItem(
          icon: Icons.home_outlined,
          activeIcon: Icons.home_rounded,
          label: 'Home',
        ),
        LiquidGlassBottomBarItem(
          icon: Icons.search_outlined,
          activeIcon: Icons.search_rounded,
          label: 'Search',
        ),
        LiquidGlassBottomBarItem(
          icon: Icons.favorite_border_rounded,
          activeIcon: Icons.favorite_rounded,
          label: 'Wishlist',
        ),
        LiquidGlassBottomBarItem(
          icon: Icons.shopping_bag_outlined,
          activeIcon: Icons.shopping_bag_rounded,
          label: 'Cart',
        ),
        LiquidGlassBottomBarItem(
          icon: Icons.person_outline_rounded,
          activeIcon: Icons.person_rounded,
          label: 'Profile',
        ),
      ],
    ).animateBottomToTop(
      duration: const Duration(milliseconds: 600),
    );
  }
}