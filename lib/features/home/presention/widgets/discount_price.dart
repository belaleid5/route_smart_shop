import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class DiscountPrice extends StatelessWidget {
  final String? discountPercentage; 

  const DiscountPrice({super.key, this.discountPercentage});

  @override
  Widget build(BuildContext context) {
    if (discountPercentage == null) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: context.color.primary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        '$discountPercentage%', 
        style: context.textStyle.copyWith(
          color: context.color.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}