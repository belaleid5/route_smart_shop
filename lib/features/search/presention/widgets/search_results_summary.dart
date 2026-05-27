import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart'; // ✅ أضف

class SearchResultsSummary extends StatelessWidget {
  const SearchResultsSummary({
    super.key,
    required this.total,
    required this.limit,
  });

  final int total;
  final int limit;

  int get _showing => limit > total ? total : limit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child:
          Text(
            "${context.translate(LangKeys.showingXOfY)},  $_showing, $total",
            style: context.textStyle.copyWith(
              fontSize: 12,
              color: context.colors.textSecondary,
            ),
          ).animateRightLeft(
            isFromStart: false,
            duration: const Duration(milliseconds: 400),
          ),
    );
  }
}
