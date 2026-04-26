import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_state.dart';

class WishlistHeartButton extends StatelessWidget {
  const WishlistHeartButton({
    super.key,
    required this.productId,
    required this.onTap,
  });

  final String productId;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      buildWhen: (previous, current) {
        final wasFav = previous.isFavorite(productId);
        final isFav = current.isFavorite(productId);
        return wasFav != isFav;
      },
      builder: (context, state) {
        final isFavorite = state.isFavorite(productId);

        return GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isFavorite
                  ? context.color.primary.withOpacity(0.15)
                  : Colors.transparent,
              border: Border.all(
                color: isFavorite
                    ? context.color.primary
                    : context.color.textPrimary.withValues(alpha: 0.15),
              ),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              transitionBuilder: (child, animation) =>
                  ScaleTransition(scale: animation, child: child),
              child: Icon(
                isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                key: ValueKey(isFavorite),
                color: isFavorite
                    ? context.color.primary
                    : context.color.textPrimary,
                size: 20,
              ),
            ),
          ),
        );
      },
    );
  }
}
