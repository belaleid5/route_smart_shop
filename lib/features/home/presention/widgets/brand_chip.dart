import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/domain/entites/brand_entity.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';

class BrandChip extends StatelessWidget {
  final BrandEntity brand;

  const BrandChip({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return GestureDetector(
      onTap: () {
        debugPrint('Tapped on Brand: ${brand.name}');
      },
      child: Container(
        width: 80,
        alignment: Alignment.center,

        decoration: BoxDecoration(
          color: colors.background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colors.textSecondary.withOpacity(0.15)),
        ),
        child: Text(
          brand.name,
          style: context.textStyle.copyWith(
            color: context.colors.textPrimary,
            fontSize: 14,
            fontWeight: FontWeightHelper.semiBold,
          ),
        ),
      ),
    );
  }
}
