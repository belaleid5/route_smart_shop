import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';

class SearchTitle extends StatelessWidget {
  const SearchTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
   
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
         context.translate(LangKeys.discover), 
          style: theme.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeightHelper.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          context.translate(LangKeys.searchSubtitle),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}