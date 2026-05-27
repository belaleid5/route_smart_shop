import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';

import 'wishlist_price_row.dart';
import 'wishlist_tag.dart';

class WishlistCardDetails extends StatelessWidget {
  const WishlistCardDetails({
    super.key,
    required this.title,
    required this.price,
    this.oldPrice,
  });

  final String title;
  final double price;
  final double? oldPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: context.textStyle.copyWith(fontSize: 12),
        ),
        verticalSpace(8),
        WishlistPriceRow(price: price, oldPrice: oldPrice),
        verticalSpace(10),
        const Row(
          spacing: 8,
          children: [WishlistTag('Pink'), WishlistTag('M')],
        ),
      ],
    );
  }
}
