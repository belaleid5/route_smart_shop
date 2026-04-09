// lib/features/search/presentation/widgets/search_brands_placeholder.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class SearchBrandsPlaceholder extends StatelessWidget {
  const SearchBrandsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Center(
        child: Text(
          'Brands coming soon',
          style: context.textStyle.copyWith(
            color: context.color.textSecondary,
          ),
        ),
      ),
    );
  }
}
