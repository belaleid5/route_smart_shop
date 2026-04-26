import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_shimmer.dart';
import 'package:route_smart/core/helper/spacing.dart';

class CartShimmerLoading extends StatelessWidget {
  const CartShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // ── Header Shimmer ─────────────────────────────
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                ShimmerWidget.rounded(
                  width: 80,
                  height: 30,
                  radius: 8,
                ),
                const SizedBox(width: 8),
                ShimmerWidget.circular(size: 30),
                const Spacer(),
                ShimmerWidget.rounded(
                  width: 60,
                  height: 20,
                  radius: 8,
                ),
              ],
            ),
          ),
          verticalSpace(8),

          // ── Cart Items Shimmer ─────────────────────────
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return const _CartItemShimmer();
              },
            ),
          ),

          // ── Bottom Bar Shimmer ─────────────────────────
          const _CartBottomBarShimmer(),
          verticalSpace(100),
        ],
      ),
    );
  }
}

class _CartItemShimmer extends StatelessWidget {
  const _CartItemShimmer();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.color.shades,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Image
          ShimmerWidget.rounded(
            width: 90,
            height: 90,
            radius: 16,
          ),
          const SizedBox(width: 14),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                ShimmerWidget.text(
                  width: double.infinity,
                  height: 16,
                ),
                verticalSpace(8),
                ShimmerWidget.text(
                  width: 120,
                  height: 14,
                ),
                verticalSpace(12),
                // Price + Quantity
                Row(
                  children: [
                    ShimmerWidget.rounded(
                      width: 70,
                      height: 22,
                      radius: 4,
                    ),
                    const Spacer(),
                    ShimmerWidget.rounded(
                      width: 100,
                      height: 34,
                      radius: 8,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CartBottomBarShimmer extends StatelessWidget {
  const _CartBottomBarShimmer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerWidget.text(
                width: 40,
                height: 12,
              ),
              verticalSpace(4),
              ShimmerWidget.rounded(
                width: 80,
                height: 24,
                radius: 4,
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ShimmerWidget.button(
              width: double.infinity,
              height: 50,
              radius: 16,
            ),
          ),
        ],
      ),
    );
  }
}