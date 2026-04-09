// lib/features/search/presentation/widgets/search_brand_arrow.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class SearchListItemArrow  extends StatelessWidget {
  const SearchListItemArrow ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: context.color.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 14,
        color: context.color.primary,
      ),
    );
  }
}
