import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';

class WishlistPageHeader extends StatelessWidget {
  const WishlistPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Text(
        context.translate(LangKeys.wishlist),
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          color: context.colors.textPrimary,
        ),
      ),
    );
  }
}
