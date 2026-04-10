// lib/features/wishlist/presentation/pages/wishlist_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/custom_toast.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_event.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_state.dart';

import '../widgets/wishlist_list.dart';
import '../widgets/wishlist_page_header.dart';
import '../widgets/wishlist_recently_viewed_section.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
 

  @override
  Widget build(BuildContext context) {
    return BlocListener<WishlistBloc, WishlistState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (message) => CustomToast.showError(context, message),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: const SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WishlistPageHeader(),
              WishlistRecentlyViewedSection(),
              Expanded(child: WishlistList()),
            ],
          ),
        ),
      ),
    );
  }
}
