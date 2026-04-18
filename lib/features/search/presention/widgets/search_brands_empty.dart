import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';

class SearchEmptyState extends StatelessWidget {
  const SearchEmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 64,
              color: context.color.primary.withValues(alpha: 0.4),
            ).animateFlipVertical(),

            verticalSpace(16),

            Text(
              title,
              style: context.textStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeightHelper.semiBold,
                color: context.color.textSecondary,
              ),
            ).animateRightLeft(duration: const Duration(milliseconds: 400)),

            verticalSpace(8),

            Text(
              subtitle,
              style: context.textStyle.copyWith(
                fontSize: 13,
                color: context.color.textSecondary.withValues(alpha: 0.6),
              ),
            ).animateRightLeft(
              isFromStart: false,
              duration: const Duration(milliseconds: 450),
            ),
          ],
        ),
      ),
    );
  }
}
