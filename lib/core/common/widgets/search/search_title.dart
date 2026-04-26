// lib/features/search/presentation/widgets/search_title.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';

class SearchTitle extends StatelessWidget {
  const SearchTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTitleGradientText(),
        verticalSpace(4),
        SearchTitleSubtitle(),
      ],
    );
  }
}

class SearchTitleGradientText extends StatelessWidget {
  const SearchTitleGradientText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Discover',
      style: context.textStyle.copyWith(
        fontSize: 32,
        fontWeight: FontWeightHelper.bold,
        foreground: Paint()
          ..shader = LinearGradient(
            colors: [context.color.primary, const Color(0xFF6DECB9)],
          ).createShader(const Rect.fromLTWH(0, 0, 200, 50)),
      ),
    );
  }
}

class SearchTitleSubtitle extends StatelessWidget {
  const SearchTitleSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Find products, brands & more',
      style: context.textStyle.copyWith(
        fontSize: 14,
        color: context.color.textSecondary,
      ),
    );
  }
}
