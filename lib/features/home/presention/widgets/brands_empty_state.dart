import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';

class BrandsEmptyState extends StatelessWidget {
  const BrandsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.store_outlined,
            size: 64,
            color: context.colors.textSecondary,
          ).animateFlipVertical(),
          const SizedBox(height: 16),
          Text(
            context.translate(LangKeys.noBrandsAvailable),
            style: TextStyle(color: context.colors.textSecondary, fontSize: 16),
          ).animateBottomToTop(),
        ],
      ),
    );
  }
}
