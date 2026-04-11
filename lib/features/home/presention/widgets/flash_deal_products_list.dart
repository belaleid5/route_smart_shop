import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        return state.maybeWhen(
          loading: () => const FlashDealShimmerList(),
          success: (products, hasReachedMax) {
            final discountedProducts = products.where((p) {
              return p.priceAfterDiscount != null &&
                  p.priceAfterDiscount! < (p.price ?? 0);
            }).toList();

            if (discountedProducts.isEmpty) {
              return const Center(child: Text('No Flash Deals Available'));
            }

            return FlashDealLoadedList(
              products: discountedProducts,
              hasReachedMax: hasReachedMax,
            );
          },
          error: (message) => Center(child: Text(message)),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
