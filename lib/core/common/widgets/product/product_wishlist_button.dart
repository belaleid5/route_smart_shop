import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
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
  late AnimationController _bounceController;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _bounceAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _bounceController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _bounceController.dispose();
    super.dispose();
  }

  Future<void> _handleTap() async {
    await _bounceController.forward();
    await _bounceController.reverse();
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.productId == null || widget.productId!.isEmpty) {
      return _buildButton(context, isFavorited: false, onTap: widget.onTap);
    }

    return BlocBuilder<WishlistBloc, WishlistState>(
   buildWhen: (previous, current) {
        final prevFav = previous.isFavorite(widget.productId!);
        final currFav = current.isFavorite(widget.productId!);

        final shouldRebuild = prevFav != currFav;
        return shouldRebuild;
      },
      builder: (context, state) {
        final isFavorited = state.isFavorite(widget.productId!);

        return ScaleTransition(
          scale: _bounceAnimation,
          child: _buildButton(
            context,
            isFavorited: isFavorited,
            onTap: _handleTap,
          ),
        );
      },
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required bool isFavorited,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: isFavorited
              ? const Color(0xFF2563EB).withOpacity(0.12)
              : context.color.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: context.color.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: animation,
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          child: Icon(
            isFavorited
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
            key: ValueKey(isFavorited),
            size: 18,
            color: isFavorited
                ? context.color.primary
                : context.color.textSecondary,
          ),
        ),
      ),
    );
  }
}