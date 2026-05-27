import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/app_cubit/app_cubit_cubit.dart';
import 'package:route_smart/core/common/widgets/search/search_input_field.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/home/presention/widgets/categories_section.dart';
import 'package:route_smart/features/home/presention/widgets/flash_deals_section.dart';
import 'package:route_smart/features/home/presention/widgets/pupolar_brands_section.dart';
import 'package:route_smart/features/home/presention/widgets/recommendtion_section.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                onTap: () => context.read<AppCubit>().changeTab(1),
                readOnly: true,
                controller: _searchController,
                onChanged: (String value) {},
                onSearch: (String value) {},
              ),
            ),
          ),
          const SliverToBoxAdapter(child: CategoriesSection()),
          const SliverToBoxAdapter(child: PopularBrandsSection()),
          const SliverToBoxAdapter(child: FlashDealsSection()),
          const SliverToBoxAdapter(child: RecommendedSection()),
          SliverToBoxAdapter(child: verticalSpace(100)),
        ],
      ),
    );
  }
}