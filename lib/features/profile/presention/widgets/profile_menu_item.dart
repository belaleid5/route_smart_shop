import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Color? textColor;
  final Color? iconColor;

  const ProfileMenuItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.trailing,
    this.textColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: (iconColor ?? context.colors.primary).withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor ?? context.colors.primary),
      ),
      title: Text(
        title,
        style: context.textStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textColor ?? context.colors.textPrimary,
        ),
      ),
      trailing:
          trailing ?? const Icon(Icons.arrow_forward_ios_rounded, size: 16),
    );
  }
}
