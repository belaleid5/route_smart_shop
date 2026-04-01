import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class BrandLoadingChip extends StatelessWidget {
  const BrandLoadingChip({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: context.color.textSecondary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }
}
