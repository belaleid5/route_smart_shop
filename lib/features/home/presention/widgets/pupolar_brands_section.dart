import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/features/home/presention/manger/brand/brands_bloc.dart';
import 'package:route_smart/features/home/presention/manger/brand/brands_event.dart';
import 'package:route_smart/features/home/presention/manger/brand/brands_state.dart';
import 'package:route_smart/features/home/presention/widgets/brand_loading_row.dart';
import 'package:route_smart/features/home/presention/widgets/error_brand.dart';
import 'package:route_smart/features/home/presention/widgets/header_section.dart';
import 'package:route_smart/features/home/presention/widgets/prands_list.dart';

class PopularBrandsSection extends StatefulWidget {
  const PopularBrandsSection({super.key});

  @override
  State<PopularBrandsSection> createState() => _PopularBrandsSectionState();
}

class _PopularBrandsSectionState extends State<PopularBrandsSection> {
  @override
  void initState() {
    super.initState();
    context.read<BrandsBloc>().add(const BrandsEvent.getBrands());
  }

  bool _onScrollNotification(ScrollNotification notification) {
    if (notification is! ScrollUpdateNotification) return false;
    if (notification.metrics.axis != Axis.horizontal) return false;

    final bool nearEnd =
        notification.metrics.pixels >=
        notification.metrics.maxScrollExtent - 150;

    if (nearEnd) {
      context.read<BrandsBloc>().add(const BrandsEvent.getBrands());
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderSection(title: 'Popular Brands'),
        const SizedBox(height: 12),
        BlocBuilder<BrandsBloc, BrandsState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const BrandsLoadingRow(),
              success: (brands, hasReachedMax) =>
                  NotificationListener<ScrollNotification>(
                    onNotification: _onScrollNotification,
                    child: BrandsList(
                      brands: brands,
                      hasReachedMax: hasReachedMax,
                    ),
                  ),
              error: (message) => BrandsError(
                message: message,
                onRetry: () => context.read<BrandsBloc>().add(
                  const BrandsEvent.getBrands(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
