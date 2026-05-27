import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';

class SearchBrandsPlaceholder extends StatelessWidget {
  const SearchBrandsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Center(
        child: Text(
          context.translate(LangKeys.brandsComingSoon),
          style: context.textStyle.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
      ),
    );
  }
}