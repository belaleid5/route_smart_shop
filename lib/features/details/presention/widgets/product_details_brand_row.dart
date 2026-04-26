import 'package:flutter/material.dart';
import 'package:route_smart/core/common/data/model/brand_response_model.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class ProductDetailsBrandRow extends StatelessWidget {
  const ProductDetailsBrandRow({super.key, required this.brand});

  final BrandData? brand;

  @override
  Widget build(BuildContext context) {
    if (brand == null) return const SizedBox.shrink();

    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Flexible(
                child: Text(
                  brand?.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: context.color.textPrimary,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.verified_rounded,
                size: 16,
                color: context.color.button,
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),

        SizedBox(
          height: 38,
          width: 92,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: context.color.button,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              padding: EdgeInsets.zero,
            ),
            child: Text(
              context.translate('follow'),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textStyle.copyWith(
                fontSize: 13,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
