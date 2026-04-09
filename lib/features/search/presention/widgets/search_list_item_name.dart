// lib/features/search/presentation/widgets/search_brand_name.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';

class SearchListItemName extends StatelessWidget {
  const SearchListItemName({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: context.textStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeightHelper.semiBold,
        color: context.color.textPrimary,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
