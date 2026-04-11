import 'package:flutter/material.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/home/presention/widgets/flash_deal_products_list.dart';
import 'package:route_smart/features/home/presention/widgets/flash_deals_section_header.dart';

class FlashDealsSection extends StatelessWidget {
  const FlashDealsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FE),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const FlashDealsSectionHeader(),
          verticalSpace(16),
          const SizedBox(height: 250, child: FlashDealProductsList()),
        ],
      ),
    );
  }
}
