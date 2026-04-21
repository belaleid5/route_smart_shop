import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class NavLink extends StatelessWidget {
  const NavLink({
    super.key,
    required this.label,
    required this.colors,
    required this.onTap,
  });

  final String label;
  final MyColors colors;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: colors.textSecondary,
          ),
        ),
      ),
    );
  }
}
