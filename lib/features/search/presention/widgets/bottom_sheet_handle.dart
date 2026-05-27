import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class BottomSheetHandle extends StatelessWidget {
  const BottomSheetHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: context.colors.stroke,
        ),
      ),
    );
  }
}
