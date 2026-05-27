import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isSelected ? 20 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isSelected
            ? context.colors.button
            : context.colors.button.withOpacity(0.3),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
