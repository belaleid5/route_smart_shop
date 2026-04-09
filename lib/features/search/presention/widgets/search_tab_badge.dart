// lib/features/search/presentation/widgets/search_tab_badge.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';

class SearchTabBadge extends StatelessWidget {
  const SearchTabBadge({
    super.key,
    required this.count,
    required this.isActive,
  });

  final int  count;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isActive
            ? context.color.white.withValues(alpha: 0.2)
            : context.color.fieldBackground,
        border: Border.all(
          color: isActive
              ? context.color.white.withValues(alpha: 0.3)
              : context.color.stroke,
        ),
      ),
      child: Text(
        '$count',
        style: context.textStyle.copyWith(
          fontSize:   11,
          fontWeight: FontWeightHelper.bold,
          color: isActive ? context.color.white : context.color.primary,
        ),
      ),
    );
  }
}
