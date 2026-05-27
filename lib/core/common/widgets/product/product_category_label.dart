// lib/core/common/widgets/product_category_label.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class ProductCategoryLabel extends StatelessWidget {
  const ProductCategoryLabel({super.key, required this.name});

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name ?? '',
      style: context.textStyle.copyWith(
        fontSize: 10,
        color: context.colors.textSecondary,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
