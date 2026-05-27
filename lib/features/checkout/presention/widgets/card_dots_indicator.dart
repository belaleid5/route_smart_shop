import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class CardDotsIndicator extends StatelessWidget {
  const CardDotsIndicator({
    super.key,
    required this.activeIndex,
    required this.count,
  });

  final int activeIndex;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == activeIndex;
        return Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: isActive
                ? context.colors.primary
                : context.colors.stroke,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
