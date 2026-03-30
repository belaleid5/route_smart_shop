import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.actionText,
    this.icon,
  });

  final String title;
  final String actionText;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.textStyle.copyWith(
              fontSize: 18,
              color: context.color.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (actionText.isNotEmpty)
            Text(
              actionText,
              style: context.textStyle.copyWith(
                fontSize: 18,
                color: context.color.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }
}
