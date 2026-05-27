import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/widgets/custom_image.dart';

class SearchListItemImage extends StatelessWidget {
  const SearchListItemImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.colors.fieldBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.colors.stroke),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CustomImage(imageType: ImagesType.network, imagePath: imageUrl),
      ),
    );
  }
}
