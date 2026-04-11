import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/features/wishlist/data/model/wishlist_response_model.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_event.dart';
import 'package:route_smart/features/wishlist/presention/widgets/wishlist_item_wrapper.dart';
import 'package:route_smart/features/wishlist/presention/widgets/wishlist_list.dart';

class WishlistAnimatedListView extends StatefulWidget {
  const WishlistAnimatedListView({super.key, required this.items});

  final List<WishlistItemModel> items;

  @override
  State<WishlistAnimatedListView> createState() =>
      _WishlistAnimatedListViewState();
}

class _WishlistAnimatedListViewState extends State<WishlistAnimatedListView> {
  final Set<String> _removingIds = {};

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: widget.items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final item = widget.items[index];
        final isRemoving = _removingIds.contains(item.id);

        return WishlistItemWrapper(
          key: ValueKey(item.id),
          item: item,
          index: index,
          isRemoving: isRemoving,
          onRemove: () => _handleRemove(context, item),
          onAddToCart: () {},
        );
      },
    );
  }

  void _handleRemove(BuildContext context, WishlistItemModel item) {
  setState(() => _removingIds.add(item.id));

  Future.delayed(const Duration(milliseconds: 800), () {
    if (mounted) {
      context.read<WishlistBloc>().add(WishlistEvent.removeFromWishlist(item.id));
      setState(() => _removingIds.remove(item.id));
    }
  });
}
}