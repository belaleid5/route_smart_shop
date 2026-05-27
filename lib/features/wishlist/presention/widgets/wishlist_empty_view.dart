import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';

class WishlistEmptyView extends StatelessWidget {
  const WishlistEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border_rounded,
            size: 90,
            color: context.colors.stroke,
          ),
          verticalSpace(16),
          Text(
            context.translate(LangKeys.wishlist),
            style: context.titleMedium,
          ),
          verticalSpace(8),
          Text(
            context.translate(LangKeys.noItemsInCart),
            textAlign: TextAlign.center,
            style: context.bodyMedium,
          ),
        ],
      ),
    );
  }
}