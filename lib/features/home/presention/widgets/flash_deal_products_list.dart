import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/home/presention/manger/product/product_bloc.dart';
import 'package:route_smart/features/home/presention/manger/product/product_state.dart';
import 'package:route_smart/features/home/presention/widgets/flash_deal_loaded_list.dart';
import 'package:route_smart/features/home/presention/widgets/flash_deal_shimmer_list.dart';

class FlashDealProductsList extends StatelessWidget {
  const FlashDealProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        return switch (state) {
          ProductsLoading() => const FlashDealShimmerList(),
          
          ProductsError(:final message) => Center(
              child: Text(
                message,
                style: TextStyle(color: context.colors.textSecondary),
              ),
            ),
          
          ProductsSuccess(:final products, :final hasReachedMax) => 
            products.isEmpty
                ? Center(
                    child: Text(context.translate(LangKeys.noFlashDealsAvailable)),
                  )
                : FlashDealLoadedList(
                    products: products,
                    hasReachedMax: hasReachedMax,
                  ),
          
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}