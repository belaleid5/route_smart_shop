import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';

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
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'EXCLUSIVE COLLECTION',
            style: context.textStyle.copyWith(
              fontSize: 12,
              color: context.color.white,
              letterSpacing: 1.2,
            ),
          ),
          verticalSpace(8),
          Text(
            title,
            style: context.textStyle.copyWith(
              color: context.color.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Container(
            alignment: Alignment.center,
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: context.color.white,
            ),
            child: Text(
              textAlign: TextAlign.center,
              'Shop Now',
              style: context.textStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
