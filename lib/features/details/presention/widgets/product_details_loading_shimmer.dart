import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/custom_shimmer.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/details/presention/widgets/product_details_app_bar.dart';

class ProductDetailsLoadingShimmer extends StatelessWidget {
  const ProductDetailsLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // Cover image shimmer
              SliverToBoxAdapter(
                child: ShimmerWidget.card(
                  height: 320,
                  radius: 0,
                  width: double.infinity,
                ),
              ),

              // Product info shimmer
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       ShimmerWidget.text(width: 220, height: 20),
                      verticalSpace(12),
                       ShimmerWidget.text(width: 160, height: 14),
                      verticalSpace(16),
                      Row(
                        children: [
                          Expanded(child: ShimmerWidget.text(height: 18)),
                          const SizedBox(width: 12),
                          ShimmerWidget.text(width: 90, height: 18),
                        ],
                      ),
                      verticalSpace(16),
                       ShimmerWidget.card(height: 80, radius: 12),
                    ],
                  ),
                ),
              ),

              // Reviews preview shimmer
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       ShimmerWidget.text(width: 140, height: 18),
                      verticalSpace(12),
                       ShimmerWidget.card(height: 90, radius: 12),
                      verticalSpace(12),
                       ShimmerWidget.card(height: 90, radius: 12),
                    ],
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 120)),
            ],
          ),

          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ProductDetailsAppBar(),
          ),

           Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: ShimmerWidget.button(
                width: double.infinity,
                height: 56,
                radius: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}