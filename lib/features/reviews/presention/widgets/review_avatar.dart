import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/custom_image.dart';

class ReviewAvatar extends StatelessWidget {
  const ReviewAvatar({super.key,required this.imageUrl});

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade200, width: 2),
      ),
      child: ClipOval(
        child: CustomImage(
          imagePath: imageUrl,
          imageType: ImagesType.network,
          boxFit: BoxFit.cover,
        ),
      ),
    );
  }
}
