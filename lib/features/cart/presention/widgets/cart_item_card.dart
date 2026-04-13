import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/cart/data/models/cart_item_model.dart';
import 'package:route_smart/features/cart/presention/widgets/cart_item_image.dart';
import 'package:route_smart/features/cart/presention/widgets/cart_item_info.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.item,
    required this.onDelete,
    required this.onIncrement,
    required this.onDecrement,
  });

  final CartItemModel item;
  final VoidCallback onDelete;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.color.shades,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RepaintBoundary(
            child: CartItemImage(
              imageUrl: item.imageUrl ?? '',
              onDelete: onDelete,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: CartItemInfo(
              title: item.productName,
              price: item.price,
              count: item.quantity,
              onIncrement: onIncrement,
              onDecrement: onDecrement,
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemCardAnimated extends StatefulWidget {
  const CartItemCardAnimated({
    super.key,
    required this.item,
    required this.onDelete,
    required this.onIncrement,
    required this.onDecrement,
    required this.index,
  });

  final CartItemModel item;
  final VoidCallback onDelete;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final int index;

  @override
  State<CartItemCardAnimated> createState() => _CartItemCardAnimatedState();
}

class _CartItemCardAnimatedState extends State<CartItemCardAnimated>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CartItemCard(
      key: ValueKey(widget.item.productId),
      item: widget.item,
      onDelete: widget.onDelete,
      onIncrement: widget.onIncrement,
      onDecrement: widget.onDecrement,
    )
        .animate()
        .fadeIn(
          duration: 400.ms,
          delay: Duration(milliseconds: widget.index * 80),
          curve: Curves.easeInOutQuart,
        )
        .moveY(
          begin: 30,
          end: 0,
          duration: 400.ms,
          delay: Duration(milliseconds: widget.index * 80),
          curve: Curves.easeInOutQuart,
        );
  }
}