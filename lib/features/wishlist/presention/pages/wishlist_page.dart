// lib/features/wishlist/presention/pages/wishlist_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_toast.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_state.dart';

import '../widgets/wishlist_list.dart';
import '../widgets/wishlist_page_header.dart';
import '../widgets/wishlist_recently_viewed_section.dart';

// lib/features/wishlist/presention/pages/wishlist_page.dart

class WishlistPage extends StatelessWidget {
  // ← StatelessWidget
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<WishlistBloc, WishlistState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (message) =>
              CustomToast.showError(context, context.translate(message)),
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
