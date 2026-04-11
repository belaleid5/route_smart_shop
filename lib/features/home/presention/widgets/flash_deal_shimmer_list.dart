import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/paginated_list_view.dart';
import 'package:route_smart/features/home/presention/widgets/flash_deal_card_shimmer.dart';

class FlashDealShimmerList extends StatelessWidget {
  const FlashDealShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginatedListView(
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
    );
  }
}
