import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/widgets/paginated_list_view.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/home/presention/manger/product/product_bloc.dart';
import 'package:route_smart/features/home/presention/manger/product/product_event.dart';
import 'package:route_smart/features/home/presention/manger/product/product_state.dart';
import 'package:route_smart/features/home/presention/widgets/build_timer_box.dart';
import 'package:route_smart/features/home/presention/widgets/flash_deal_card.dart';
import 'package:route_smart/features/home/presention/widgets/flash_deal_card_shimmer.dart';

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
          Row(
            children: [
              Text(
                'Flash Deals',
                style: context.textStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              horizontalSpace(12),
              const FlashDealTimer(totalSeconds: 7200),
            ],
          ),
          verticalSpace(16),
          SizedBox(
            height: 250,
            child: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => PaginatedListView(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    hasMore: false,
                    isLoading: false,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: FlashDealCardShimmer(),
                      );
                    },
                  ),
                  success: (products, hasReachedMax) {
                    final discountedProducts = products.where((product) {
                      return product.priceAfterDiscount != null &&
                          product.priceAfterDiscount! < (product.price ?? 0);
                    }).toList();

                    if (discountedProducts.isEmpty) {
                      return const Center(
                        child: Text('No Flash Deals Available'),
                      );
                    }

                    return PaginatedListView(
                      scrollDirection: Axis.horizontal,
                      itemCount: discountedProducts.length,
                      hasMore: !hasReachedMax,
                      isLoading: state.maybeMap(
                        loading: (_) => true,
                        orElse: () => false,
                      ),
                      isSmoothListView: true,
                      loadMore: () {
                        context.read<ProductsBloc>().add(
                          const ProductsEvent.getProducts(),
                        );
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: FlashDealCard(
                            product: discountedProducts[index],
                          ),
                        ).animateBottomToTop(
                          duration: Duration(milliseconds: 300 + (index * 100)),
                        );
                      },
                    );
                  },
                  error: (message) => Center(child: Text(message)),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
