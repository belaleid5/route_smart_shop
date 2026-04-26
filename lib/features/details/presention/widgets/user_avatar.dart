import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, required this.name, required this.colors});

  final String name;
  final MyColors colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colors.primary.withOpacity(0.1),
        border: Border.all(color: colors.primary.withOpacity(0.2), width: 1.5),
      ),
      child: Center(
        child: Text(
          name.isNotEmpty ? name[0].toUpperCase() : '?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: colors.primary,
          ),
        ),
      ),
    );
  }
}
