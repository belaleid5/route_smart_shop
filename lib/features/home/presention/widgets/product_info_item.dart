import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class ProductInfoItem extends StatelessWidget {
  final String? categoryName;
  final String? title;
  final num? price; 
  final num? priceAfterDiscount; 
  final num? rating;

  const ProductInfoItem({
    super.key,
    this.categoryName,
    this.title,
    this.price,
    this.priceAfterDiscount,
    this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              categoryName ?? '',
              style: context.textStyle.copyWith(color: context.color.textSecondary, fontSize: 10),
            ),
            Text(
              title ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            
            Row(
              children: [
                Text(
                  '${priceAfterDiscount ?? price ?? 0} EGP',
                  style: context.textStyle.copyWith(
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF1E293B),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(width: 6),
                if (priceAfterDiscount != null)
                  Text(
                    '$price',
                    style: context.textStyle.copyWith(
                      fontSize: 10,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough, 
                    ),
                  ),
              ],
            ),
            
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 12),
                const SizedBox(width: 2),
                Text(
                  '${rating ?? 0}',
                  style: context.textStyle.copyWith(fontSize: 10, color: context.color.textSecondary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}