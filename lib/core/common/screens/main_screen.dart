import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_glass_bottom_bar/liquid_glass_bottom_bar.dart';
import 'package:route_smart/core/di/di.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_toast.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/cart/presention/manger/cart_event.dart';
import 'package:route_smart/features/cart/presention/manger/cart_state.dart';
import 'package:route_smart/features/cart/presention/page/cart_page.dart';
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
  late final CartBloc _cartBloc;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _wishlistBloc = context.read<WishlistBloc>();
    _cartBloc = context.read<CartBloc>();

    _pages = [
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => sl<CategoriesBloc>()
              ..add(const CategoriesEvent.getCategories()),
          ),
          BlocProvider(
            create: (_) => sl<BrandsBloc>()
              ..add(const BrandsEvent.getBrands()),
          ),
          BlocProvider(
            create: (_) => sl<ProductsBloc>()
              ..add(const ProductsEvent.getProducts()),
          ),
          BlocProvider.value(value: _wishlistBloc),
          BlocProvider.value(value: _cartBloc),
        ],
        child: const HomeScreen(),
      ),
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => sl<SearchBloc>()
              ..add(const SearchEventSearch()),
          ),
          BlocProvider.value(value: _wishlistBloc),
          BlocProvider.value(value: _cartBloc),
        ],
        child: const SearchScreen(),
      ),
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _wishlistBloc),
          BlocProvider.value(value: _cartBloc),
        ],
        child: const WishlistPage(),
      ),
      BlocProvider.value(
        value: _cartBloc,
        child: const CartPage(),
      ),
      const Center(child: Text('Profile 👤')),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onTabTap(int index) {
    if (_currentIndex == index) return;

    setState(() => _currentIndex = index);

    if (index == 2) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _wishlistBloc.add(const GetWishlistEvent());
      });
    } else if (index == 3) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _cartBloc.add(const CartEvent.getCart());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listenWhen: (previous, current) => current.maybeWhen(
        error: (_) => true,
        orElse: () => false,
      ),
      listener: (context, state) {
        state.whenOrNull(
          error: (message) => CustomToast.showError(context, message),
        );
      },
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
        bottomNavigationBar: _buildBottomNav(context),
      ),
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