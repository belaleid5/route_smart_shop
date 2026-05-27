import 'package:flutter/material.dart';
import 'package:route_smart/features/wishlist/presention/pages/wishlist_page.dart'; // ✅ دي اللي هنعدلها

class WishlistTab extends StatefulWidget {
  const WishlistTab({super.key});

  @override
  State<WishlistTab> createState() => _WishlistTabState();
}

class _WishlistTabState extends State<WishlistTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const WishlistPage(); 
  }
}