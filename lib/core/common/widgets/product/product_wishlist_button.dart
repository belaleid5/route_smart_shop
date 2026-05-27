import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_state.dart';

class ProductWishlistButton extends StatefulWidget {
  const ProductWishlistButton({
    super.key,
    this.onTap,
    this.productId,
  });

  final VoidCallback? onTap;
  final String? productId;

  @override
  State<ProductWishlistButton> createState() => _ProductWishlistButtonState();
}

class _ProductWishlistButtonState extends State<ProductWishlistButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleTap() async {

    await _controller.forward().then((_) => _controller.reverse());
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {

    if (widget.productId == null || widget.productId!.isEmpty) {
      return _buildIcon(context, isFav: false, onTap: widget.onTap);
    }

  
    return BlocBuilder<WishlistBloc, WishlistState>(
      buildWhen: (prev, curr) =>
          prev.isFavorite(widget.productId!) != curr.isFavorite(widget.productId!),
      builder: (context, state) {
        final isFav = state.isFavorite(widget.productId!);
        return ScaleTransition(
          scale: _scaleAnim,
          child: _buildIcon(context, isFav: isFav, onTap: _handleTap),
        );
      },
    );
  }

  Widget _buildIcon(BuildContext context, {required bool isFav, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque, 
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: isFav
              ? context.colors.button.withOpacity(0.12)
              : context.colors.surface,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: context.colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, anim) =>
              ScaleTransition(scale: anim, child: FadeTransition(opacity: anim, child: child)),
          child: Icon(
            isFav ? Icons.favorite_rounded : Icons.favorite_border_rounded,
            key: ValueKey(isFav), 
            size: 16,
            color: isFav ? context.colors.primary : context.colors.textSecondary,
          ),
        ),
      ),
    );
  }
}