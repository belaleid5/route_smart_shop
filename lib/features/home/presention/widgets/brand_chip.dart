import 'package:flutter/widgets.dart';
import 'package:route_smart/core/common/data/model/brand_response_model.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class BrandChip extends StatelessWidget {
  final BrandData brand;

  const BrandChip({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('Tapped on Brand: ${brand.name}');
      },
      child: Container(
        constraints: const BoxConstraints(minWidth: 80),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: context.color.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: context.color.textSecondary.withOpacity(0.2),
          ),
          boxShadow: [
            BoxShadow(
              color: context.color.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          brand.name!,
          style: context.textStyle.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: context.color.textPrimary,
          ),
        ),
      ),
    );
  }
}
