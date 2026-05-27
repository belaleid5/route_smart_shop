import 'package:flutter/material.dart';
import 'package:route_smart/features/wishlist/presention/widgets/wishlist_list.dart';
import 'package:route_smart/features/wishlist/presention/widgets/wishlist_page_header.dart';
import 'package:route_smart/features/wishlist/presention/widgets/wishlist_recently_viewed_section.dart';

class WishlistBody extends StatelessWidget {
  const WishlistBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WishlistPageHeader(),
          WishlistRecentlyViewedSection(),
          Expanded(child: WishlistList()),
        ],
      ),
    );
  }
}