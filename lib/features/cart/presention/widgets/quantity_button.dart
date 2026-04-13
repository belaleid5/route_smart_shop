import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class QuantityButton extends StatelessWidget {
  const QuantityButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: context.color.button, width: 1.5),
        ),
        child: Icon(icon, size: 18, color: context.color.button),
      ),
    );
  }
}