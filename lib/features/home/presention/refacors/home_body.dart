import 'package:flutter/material.dart';
import 'package:route_smart/features/home/presention/widgets/categories_section.dart';
import 'package:route_smart/features/home/presention/widgets/flash_deals_section.dart';
import 'package:route_smart/features/home/presention/widgets/pupolar_brands_section.dart';
import 'package:route_smart/features/home/presention/widgets/recommendtion_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: SearchBar(controller: searchController),
            ),
          ),

          SliverToBoxAdapter(child: CategoriesSection()),

          SliverToBoxAdapter(child: PopularBrandsSection()),

          const SliverToBoxAdapter(child: FlashDealsSection()),

          SliverToBoxAdapter(child: RecommendedSection()),

          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }
}
