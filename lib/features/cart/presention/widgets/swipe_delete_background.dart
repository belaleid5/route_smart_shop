import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';

class SwipeDeleteBackground extends StatelessWidget {
  const SwipeDeleteBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.colors.primary.withValues(alpha: 0.75),
            context.colors.primary,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: context.colors.primary.withValues(alpha: 0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.delete_rounded,
            color: context.colors.white,
            size: 28,
          ),
          verticalSpace(4),
          Text(
            context.translate(LangKeys.itemRemoved),
            style: context.labelSmall.copyWith(
              color: context.colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
