// lib/core/common/widgets/product_category_label.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class ProductCategoryLabel extends StatelessWidget {
  const ProductCategoryLabel({super.key, required this.name});

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name ?? 'Unknown',
      style: context.textStyle.copyWith(
        fontSize: 10,
        color: context.color.textSecondary,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}