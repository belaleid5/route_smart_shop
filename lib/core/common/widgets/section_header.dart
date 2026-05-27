import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, required this.actionText, this.icon});
  final String title, actionText;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: context.textStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
          if (actionText.isNotEmpty)
            Text(actionText, style: context.textStyle.copyWith(fontSize: 14, color: context.colors.primary, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}