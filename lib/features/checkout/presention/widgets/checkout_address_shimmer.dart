import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_shimmer.dart';
import 'package:route_smart/core/helper/spacing.dart';

class CheckoutAddressShimmer extends StatelessWidget {
  const CheckoutAddressShimmer({super.key, this.itemCount = 2});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        itemCount,
        (_) => const _AddressCardShimmer(),
      ),
    );
  }
}

class _AddressCardShimmer extends StatelessWidget {
  const _AddressCardShimmer();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: context.color.shades,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.color.stroke,
        ),
      ),
      child: Row(
        children: [
          // ── Map Icon Placeholder ───────────────────
          ShimmerWidget.rounded(
            width: 80,
            height: 70,
            radius: 12,
          ),
          const SizedBox(width: 14),

          // ── Address Info ───────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerWidget.text(width: 100, height: 16),
                verticalSpace(8),
                ShimmerWidget.text(width: double.infinity, height: 12),
                verticalSpace(6),
                ShimmerWidget.text(width: 150, height: 12),
              ],
            ),
          ),

          // ── Selection Icon ─────────────────────────
          const SizedBox(width: 8),
          ShimmerWidget.circular(size: 24),
        ],
      ),
    );
  }
}