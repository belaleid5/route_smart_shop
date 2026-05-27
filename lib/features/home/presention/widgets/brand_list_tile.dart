import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/domain/entites/brand_entity.dart';
import 'package:route_smart/core/common/widgets/custom_image.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/core/routes/routes_names.dart';

class BrandListTile extends StatelessWidget {
  final BrandEntity brand;

  const BrandListTile({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: context.colors.secondary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.colors.stroke),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: context.colors.fieldBackground,
            shape: BoxShape.circle,
            border: Border.all(color: context.colors.stroke),
          ),
          child: ClipOval(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: CustomImage(
                imageType: ImagesType.network,
                imagePath: brand.image ?? '',
              ),
            ),
          ),
        ),
        title: Text(
          brand.name,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: context.colors.textPrimary,
          ),
        ),
        subtitle: Text(
          context.translate(LangKeys.viewProduct),
          style: TextStyle(fontSize: 12, color: context.colors.textSecondary),
        ),
        trailing: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: context.colors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 14,
            color: context.colors.primary,
          ),
        ),
        onTap: () => Navigator.pushNamed(
          context,
          AppRoutesNames.filteredProducts,
          arguments: {
            'title': brand.name,
            'categoryId': null,
            'brandId': brand.id,
          },
        ),
      ),
    );
  }
}
