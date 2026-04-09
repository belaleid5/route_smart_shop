// lib/core/common/widgets/product_image.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/custom_image.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        color: context.color.secondary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: CustomImage(
        height: 220,
        boxFit: BoxFit.cover,
        imageType: ImagesType.network,
        imagePath: imageUrl,
      ),
    );
  }
}
