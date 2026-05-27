import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/widgets/custom_image.dart';

class CheckoutProductImage extends StatelessWidget {
  const CheckoutProductImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: imageUrl.isNotEmpty
          ? CustomImage(
              imagePath: imageUrl,
              imageType: ImagesType.network,
              boxFit: BoxFit.cover,
              width: 80,
              height: 80,
            )
          : Container(
              width: 80,
              height: 80,
              color: context.colors.shades,
              child: Icon(
                Icons.image_outlined,
                color: context.colors.textSecondary,
                size: 32,
              ),
            ),
    );
  }
}
