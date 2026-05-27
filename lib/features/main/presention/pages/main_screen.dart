import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/app_cubit/app_cubit_cubit.dart';
import 'package:route_smart/core/app/app_cubit/app_state.dart';
import 'package:route_smart/core/di/di.dart';
import 'package:route_smart/core/services/flutter_secure.dart';
import 'package:route_smart/core/services/shared_pref/shared_keys.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/cart/presention/manger/cart_event.dart';
import 'package:route_smart/features/home/presention/manger/brand/brands_bloc.dart';
import 'package:route_smart/features/home/presention/manger/brand/brands_event.dart';
import 'package:route_smart/features/home/presention/manger/categroy/categories_bloc.dart';
import 'package:route_smart/features/home/presention/manger/categroy/categories_event.dart';
import 'package:route_smart/features/home/presention/manger/product/product_bloc.dart';
import 'package:route_smart/features/home/presention/manger/product/product_event.dart';
import 'package:route_smart/features/main/presention/taps/cart_tab.dart';
import 'package:route_smart/features/main/presention/taps/home_tab.dart';
import 'package:route_smart/features/main/presention/taps/profile_tab.dart';
import 'package:route_smart/features/main/presention/taps/search_tab.dart';
import 'package:route_smart/features/main/presention/taps/wishlist_tab.dart';
import 'package:route_smart/features/profile/presention/manger/profile_bloc.dart';
import 'package:route_smart/features/profile/presention/manger/profile_event.dart';
import 'package:route_smart/features/search/presention/manger/search_bloc.dart';
import 'package:route_smart/features/search/presention/manger/search_event.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_event.dart';

import '../widgets/main_bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;

  late final AnimationController _pageController;
  late final Animation<double> _pageFadeAnimation;
  late final Animation<Offset> _pageSlideAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();

    // ✅ اقرأ الـ tab المطلوب من الـ Cubit
    _currentIndex = context.read<AppCubit>().currentTabIndex;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      sl<CategoriesBloc>().add(const GetCategoriesEvent());
      sl<BrandsBloc>().add(const GetBrandsEvent());
      sl<ProductsBloc>().add(const GetProductsEvent());
      sl<WishlistBloc>().add(const GetWishlistEvent());
      sl<CartBloc>().add(const GetCartRequested());
      sl<SearchBloc>().add(const SearchEventSearch());

      final userId = await sl<SecureStorage>().read(PrefKeys.userId);
      if (userId != null) {
        sl<ProfileBloc>().add(ProfileFetchRequested(userId: userId));
      }
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) _pageController.forward();
    });
  }

  void _initAnimations() {
    _pageController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _pageFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _pageController, curve: Curves.easeOut));

    _pageSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.02),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _pageController, curve: Curves.easeOut));
  }

  void _onTabTap(int index) {
    if (_currentIndex == index) {
      HapticFeedback.lightImpact();
      return;
    }

    HapticFeedback.selectionClick();
    setState(() => _currentIndex = index);
    _pageController.reset();
    _pageController.forward();
    context.read<AppCubit>().changeTab(index);
  }

  Future<bool> _onWillPop() async {
    if (_currentIndex != 0) {
      setState(() => _currentIndex = 0);
      _pageController.reset();
      _pageController.forward();
      context.read<AppCubit>().changeTab(0);
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldPop = await _onWillPop();
        if (shouldPop && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: sl<CategoriesBloc>()),
          BlocProvider.value(value: sl<BrandsBloc>()),
          BlocProvider.value(value: sl<ProductsBloc>()),
          BlocProvider.value(value: sl<WishlistBloc>()),
          BlocProvider.value(value: sl<CartBloc>()),
          BlocProvider.value(value: sl<ProfileBloc>()),
          BlocProvider.value(value: sl<SearchBloc>()),
        ],
        child: BlocListener<AppCubit, AppState>(
          listenWhen: (previous, current) =>
              previous.tabIndex != current.tabIndex,
          listener: (context, state) {
            if (_currentIndex != state.tabIndex) {
              setState(() => _currentIndex = state.tabIndex);
            }
          },
          child: Scaffold(
            extendBody: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: AnimatedBuilder(
              animation: _pageController,
              builder: (context, _) {
                return FadeTransition(
                  opacity: _pageFadeAnimation,
                  child: SlideTransition(
                    position: _pageSlideAnimation,
                    child: IndexedStack(
                      index: _currentIndex,
                      children: const [
                        HomeTab(),
                        SearchTabPage(),
                        WishlistTab(),
                        CartTab(),
                        ProfileTab(),
                      ],
                    ),
                  ),
                );
              },
            ),
            bottomNavigationBar: MainBottomNavBar(
              currentIndex: _currentIndex,
              onTap: _onTabTap,
            ),
          ),
        ),
      ),
    );
  }
}