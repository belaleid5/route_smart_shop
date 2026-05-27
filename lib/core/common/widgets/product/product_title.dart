// lib/core/common/widgets/product_title.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key, required this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? 'No Title',
      style: context.textStyle.copyWith(
        fontSize: 12,
        fontWeight: FontWeightHelper.semiBold,
        height: 1.3,
        color: context.colors.textPrimary,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
