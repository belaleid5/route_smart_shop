import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/custom_image.dart';
import 'package:route_smart/features/cart/presention/widgets/delete_button.dart';

class CartItemImage extends StatelessWidget {
  const CartItemImage({
    super.key,
    required this.imageUrl,
    required this.onDelete,
  });

  final String imageUrl;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CustomImage(
            width: 100,
            height: 120,
            boxFit: BoxFit.cover,
            imageType: ImagesType.network,
            imagePath: imageUrl,
          ),
        ),
        Positioned(
          bottom: -10,
          left: -10,
          child: DeleteButton(onDelete: onDelete),
        ),
      ],
    );
  }
}