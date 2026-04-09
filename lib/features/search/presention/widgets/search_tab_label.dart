
import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';

class SearchTabLabel extends StatelessWidget {
  const SearchTabLabel({
    super.key,
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        label,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: context.textStyle.copyWith(
          fontSize: 13,
          fontWeight: FontWeightHelper.semiBold,
          color: color,
        ),
      ),
    );
  }
}