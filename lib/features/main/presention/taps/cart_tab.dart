import 'package:flutter/material.dart';
import 'package:route_smart/features/cart/presention/page/cart_page.dart'; // ✅ دي اللي هنعدلها

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    // ❌ تم حذف إطلاق الـ Events من هنا
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const CartPage(); // ✅ CartPage هي اللي هتطلق الـ Events
  }
}