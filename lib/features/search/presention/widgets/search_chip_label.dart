import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class SearchChipLabel extends StatelessWidget {
  const SearchChipLabel({super.key, required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(label, style: context.textStyle.copyWith(fontSize: 12));
  }
}
