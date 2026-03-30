
import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart'; 
import 'package:route_smart/core/extensions/context_extensions.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.textStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
         .animateRightLeft(
            duration: const Duration(milliseconds: 300),
          ), 
          
          Text(
            'See All',
            style: context.textStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: context.colors.primary,
            ),
          )
         .animateRightLeft(
            duration: const Duration(milliseconds: 450),
          ),
        ],
      ),
    );
  }
}