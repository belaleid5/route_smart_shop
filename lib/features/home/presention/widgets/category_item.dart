import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/domain/entites/category_entity.dart';
import 'package:route_smart/core/common/widgets/custom_image.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/styles/app_images.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    required this.onTap,
  });

  final CategoryEntity category;
  final VoidCallback onTap;

  String get _firstLetter {
    final name = category.name.trim();
    if (name.isEmpty) return '?';
    return name[0].toUpperCase();
  }

  bool get _hasValidImage {
    final image = category.image?.trim();
    if (image == null || image.isEmpty) return false;
    if (image.toLowerCase() == 'null') return false;
    if (image.startsWith('http') == false && image.startsWith('https') == false) {
      return false; // لو مش رابط أصلاً
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final hasImage = _hasValidImage;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: hasImage
                  ? context.colors.textSecondary.withOpacity(0.08)
                  : context.colors.primary.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: hasImage
                  ? CustomImage(
                      imageType: ImagesType.network,
                      imagePath: category.image!,
                      width: 80,
                      height: 80,
                      boxFit: BoxFit.cover,
                      isCircular: true,
                      
                      fallbackPath: AppImages.fashionImage, 
                    )
                  : Center(
                      child: Text(
                        _firstLetter,
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple, // أو context.colors.primary
                        ),
                      ),
                    ),
            ),
          ),
          verticalSpace(6),
          SizedBox(
            width: 80,
            child: Text(
              category.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.textStyle.copyWith(
                fontSize: 11.5,
                fontWeight: FontWeight.w500,
                color: context.colors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    ).animateBottomToTop();
  }
}