import 'package:flutter/material.dart';
import 'package:route_smart/core/common/domain/entites/product_entity.dart';
import 'package:route_smart/core/common/widgets/product/product_card_item.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';

class GridViewProducts extends StatefulWidget {
  const GridViewProducts({
    super.key,
    required this.products,
    required this.onProductTap,
    this.onFavoriteTap,
    this.onAddToCartTap,
    this.hasReachedMax = false,
    this.isLoadingMore = false,
    this.isSliver = false,
  });

  final List<ProductEntity> products;
  final bool hasReachedMax;
  final bool isLoadingMore;
  final bool isSliver;
  final ValueChanged<ProductEntity> onProductTap;
  final ValueChanged<ProductEntity>? onFavoriteTap;
  final ValueChanged<ProductEntity>? onAddToCartTap;

  @override
  State<GridViewProducts> createState() => _GridViewProductsState();
}

class _GridViewProductsState extends State<GridViewProducts> {
  final Set<String> _addedToCartIds = {};

  void _handleAddToCart(ProductEntity product) {
    setState(() => _addedToCartIds.add(product.id));
    widget.onAddToCartTap?.call(product);
  }

  int get _itemCount => widget.products.length + (widget.hasReachedMax ? 0 : 1);

  Widget _buildItem(BuildContext context, int index) {
    if (index == widget.products.length) {
      return widget.isLoadingMore
          ? const Center(child: CircularProgressIndicator())
          : const SizedBox.shrink();
    }

    final product = widget.products[index];
    final durationMs = (300 + (index * 50)).clamp(300, 800);

    return ProductCardItem(
      product: product,
      isAddedToCart: _addedToCartIds.contains(product.id),
      onTap: () => widget.onProductTap(product),
      onFavoriteTap: () => widget.onFavoriteTap?.call(product),
      onAddToCart: () => _handleAddToCart(product),
    ).animateBottomToTop(duration: Duration(milliseconds: durationMs));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.products.isEmpty) {
      return Center(child: Text(context.translate(LangKeys.noProductsFound)));
    }

    if (widget.isSliver) {
      return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          delegate: SliverChildBuilderDelegate(
            _buildItem,
            childCount: _itemCount,
          ),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: _itemCount,
      itemBuilder: _buildItem,
    );
  }
}
