import 'package:flutter/material.dart';
import 'package:route_smart/core/common/data/model/category_response_model.dart';
import 'package:route_smart/core/common/widgets/custom_image.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

  final CategoryData category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: context.color.textSecondary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: CustomImage(
              imageType: ImagesType.network,
              imagePath: category.image ?? '',
            ),
          ),
        ),
        verticalSpace(8),
        SizedBox(
          width: 75,
          child: Text(
            category.name ?? '',
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textStyle.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: context.color.textPrimary,
            ),
          ),
        ),
      ],
    ).animateBottomToTop(duration: const Duration(milliseconds: 500));
  }
}