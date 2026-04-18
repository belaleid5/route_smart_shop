// lib/features/search/presentation/widgets/search_brand_info.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/search/presention/widgets/search_list_item_name.dart';

import 'search_brand_slug.dart';

class SearchListItemInfo extends StatelessWidget {
  const SearchListItemInfo({
    super.key,
    required this.name,
    required this.subtitle,
  });

  final String name;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SearchListItemName(name: name),
        verticalSpace(4),
        SearchListItemSubtitle(slug: subtitle),
      ],
    );
  }
}
