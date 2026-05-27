import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class SearchErrorMessage extends StatelessWidget {
  const SearchErrorMessage({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: context.textStyle.copyWith(
        color: context.colors.textSecondary,
      ),
      textAlign: TextAlign.center,
    );
  }
}
