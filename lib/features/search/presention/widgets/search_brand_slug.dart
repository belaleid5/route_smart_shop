import 'package:route_smart/core/extensions/context_extensions.dart';
// lib/features/search/presentation/widgets/search_brand_slug.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class SearchListItemSubtitle extends StatelessWidget {
  const SearchListItemSubtitle({super.key, required this.slug});

  final String slug;

  @override
  Widget build(BuildContext context) {
    return Text(
      slug,
      style: context.textStyle.copyWith(
        fontSize: 12,
        color: context.colors.textSecondary,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
