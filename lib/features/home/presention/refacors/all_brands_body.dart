import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/widgets/paginated_list_view.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/features/home/presention/manger/brand/brands_bloc.dart';
import 'package:route_smart/features/home/presention/manger/brand/brands_event.dart';
import 'package:route_smart/features/home/presention/manger/brand/brands_state.dart';
import '../widgets/brand_list_tile.dart';
import '../widgets/brands_empty_state.dart';
import '../widgets/brands_error_state.dart';
import '../widgets/brands_shimmer_list.dart';

class AllBrandsBody extends StatelessWidget {
  const AllBrandsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsBloc, BrandsState>(
      builder: (context, state) {
        return switch (state) {
          BrandsInitial() || BrandsLoading() => const BrandsShimmerList(),
          
          BrandsError(:final message) => BrandsErrorState(message: message),
          
          BrandsSuccess(:final brands, :final hasReachedMax) => 
            brands.isEmpty
                ? const BrandsEmptyState()
                : PaginatedListView(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: brands.length,
                    hasMore: !hasReachedMax,
                    isLoading: false,
                    loadMore: () => context.read<BrandsBloc>().add(const GetBrandsEvent()),
                    itemBuilder: (context, index) {
                      final brand = brands[index];
                      return BrandListTile(brand: brand).animateBottomToTop(
                        duration: Duration(milliseconds: 300 + (index * 30)),
                      );
                    },
                  ),
        };
      },
    );
  }
}