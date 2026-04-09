import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class SearchClearButton extends StatelessWidget {
  const SearchClearButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.color.primary.withValues(alpha: 0.1),
          border: Border.all(
            color: context.color.primary.withValues(alpha: 0.3),
          ),
        ),
        child: Icon(
          Icons.close_rounded,
          size: 18,
          color: context.color.primary,
        ),
      ),
    );
  }
}