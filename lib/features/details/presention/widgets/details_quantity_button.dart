import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class DetailsQuantityButton extends StatelessWidget {
  const DetailsQuantityButton({
    super.key,
    required this.icon,
    required this.onTap,
    required this.filled,
  });

  final IconData icon;
  final VoidCallback onTap;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: filled ? context.color.button : Colors.transparent,
          shape: BoxShape.circle,
          border: filled
              ? null
              : Border.all(
                  color: context.color.textPrimary.withOpacity(0.3),
                ),
        ),
        child: Icon(
          icon,
          size: 18,
          color: filled ? Colors.white : context.color.textPrimary,
        ),
      ),
    );
  }
}
