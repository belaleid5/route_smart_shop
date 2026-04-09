import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';

class SearchCategoryTile extends StatelessWidget {
  const SearchCategoryTile({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.fieldBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.color.primary.withValues(alpha: 0.2),
        ),
      ),
      child: Center(
        child: Text(
          name,
          style: context.textStyle.copyWith(
            fontWeight: FontWeightHelper.medium,
            color: context.color.textPrimary,
          ),
        ),
      ),
    );
  }
}