import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/common/widgets/smooth_list_view.dart';
import 'package:route_smart/features/wishlist/domain/entites/wishlist_entity.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_event.dart';
import 'package:route_smart/features/wishlist/presention/widgets/wishlist_item_wrapper.dart';

class WishlistAnimatedListView extends StatefulWidget {
  const WishlistAnimatedListView({
    super.key,
    required this.items,
    required this.onAddToCart,
  });

  final List<WishlistEntity> items;
  final void Function(String productId) onAddToCart;

  @override
  State<WishlistAnimatedListView> createState() =>
      _WishlistAnimatedListViewState();
}

class _WishlistAnimatedListViewState extends State<WishlistAnimatedListView> {
  final Set<String> _removingIds = {};

  void _handleRemove(BuildContext context, WishlistEntity item) {
    final bloc = context.read<WishlistBloc>();
    setState(() => _removingIds.add(item.id));

    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        bloc.add(RemoveFromWishlistEvent(item.id));
        setState(() => _removingIds.remove(item.id));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SmoothListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: widget.items.length,
      separatorBuilder: (_, __) => verticalSpace(16),
      itemBuilder: (context, index) {
        final item = widget.items[index];
        final isRemoving = _removingIds.contains(item.id);

        return WishlistItemWrapper(
          key: ValueKey(item.id),
          item: item,
          index: index,
          isRemoving: isRemoving,
          onRemove: () => _handleRemove(context, item),
          onAddToCart: () => widget.onAddToCart(item.id),
        );
      },
      duration: const Duration(milliseconds: 800),
    );
  }
}