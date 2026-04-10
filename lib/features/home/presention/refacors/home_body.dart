import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/search/search_input_field.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/routes/routes_names.dart';
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
              child: SearchInputField(
                onTap: ()=>  context.pushName(AppRoutesNames.search),
                readOnly: true,
                controller: searchController,
                onChanged: (String value) {},
                onSearch: (String value) {},
              ),
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
