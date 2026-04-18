import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/home/presention/widgets/build_timer_box.dart';

class FlashDealsSectionHeader extends StatelessWidget {
  const FlashDealsSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Flash Deals',
          style: context.textStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ).animateRightLeft(isFromStart: false),
        horizontalSpace(12),
        const FlashDealTimer(totalSeconds: 7200).animateRightLeft(
          isFromStart: true,
        ),
      ],
    );
  }
}