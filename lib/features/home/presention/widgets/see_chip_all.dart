import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class SeeAllChip extends StatelessWidget {
  final VoidCallback onTap;
  const SeeAllChip({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: context.colors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 16,
          color: context.colors.primary,
        ),
      ),
    );
  }
}
