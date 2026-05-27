import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class BuildBannerCard extends StatelessWidget {
  const BuildBannerCard({
    super.key,
    required this.title,
    required this.bgColor,
  });

  final String title;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'EXCLUSIVE COLLECTION',
            style: context.textStyle.copyWith(
              fontSize: 12,
              color: context.colors.white,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: context.textStyle.copyWith(
              color: context.colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: context.colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              'Shop Now',
              style: context.textStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: bgColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}