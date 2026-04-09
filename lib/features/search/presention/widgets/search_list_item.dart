// lib/features/search/presentation/widgets/search_brand_list_item.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/search/presention/widgets/search_list_item_info.dart';

import 'search_brand_arrow.dart';
import 'search_brand_logo.dart';

class SearchListItem extends StatelessWidget {
  const SearchListItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.subtitle,
    this.onTap,
  });

  final String imageUrl;
  final String name;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.color.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: context.color.primary.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: context.color.stroke),
        ),
        child: Row(
          children: [
            SearchListItemImage(imageUrl: imageUrl),
            const SizedBox(width: 16),
            Expanded(
              child: SearchListItemInfo(name: name, subtitle: subtitle),
            ),
            const SearchListItemArrow(),
          ],
        ),
      ),
    );
  }
}
