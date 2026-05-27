
import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/custom_shimmer.dart';
import 'package:route_smart/core/helper/spacing.dart';

class WishlistLoadingShimmer extends StatelessWidget {
  const WishlistLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 4,
      separatorBuilder: (_, __) => verticalSpace(20),
      itemBuilder: (_, __) => const _WishlistCardShimmer(),
    );
  }
}


class _WishlistCardShimmer extends StatelessWidget {
  const _WishlistCardShimmer();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Image Shimmer ──────────────────────
        ShimmerWidget.rounded(
          width: 110,
          height: 125,
          radius: 12,
        ),
        horizontalSpace(12),
        // ── Details Shimmer ────────────────────
        const Expanded(child: _CardDetailsShimmer()),
        horizontalSpace(8),
        // ── Cart Button Shimmer ────────────────
        const _CartButtonShimmer(),
      ],
    );
  }
}

// ─────────────────────────────────────────────
//  DETAILS SHIMMER  (SRP)
// ─────────────────────────────────────────────
class _CardDetailsShimmer extends StatelessWidget {
  const _CardDetailsShimmer();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title line 1
        ShimmerWidget.text(
          width: double.infinity,
          height: 14,
        ),
        verticalSpace(6),
        // Title line 2
        ShimmerWidget.text(
          width: 160,
          height: 14,
        ),
        verticalSpace(10),
        // Price
        ShimmerWidget.text(
          width: 90,
          height: 22,
          radius: 4,
        ),
        verticalSpace(10),
        // Tags
        const _TagsShimmer(),
      ],
    );
  }
}

// ─────────────────────────────────────────────
//  TAGS SHIMMER  (SRP)
// ─────────────────────────────────────────────
class _TagsShimmer extends StatelessWidget {
  const _TagsShimmer();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ShimmerWidget.button(
          width: 65,
          height: 32,
          radius: 8,
        ),
        horizontalSpace(8),
        ShimmerWidget.button(
          width: 45,
          height: 32,
          radius: 8,
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
//  CART BUTTON SHIMMER  (SRP)
// ─────────────────────────────────────────────
class _CartButtonShimmer extends StatelessWidget {
  const _CartButtonShimmer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: ShimmerWidget.square(
        size: 38,
        radius: 10,
      ),
    );
  }
}