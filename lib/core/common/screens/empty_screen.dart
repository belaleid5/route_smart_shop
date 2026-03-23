import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/custom_image.dart';
import 'package:route_smart/core/styles/app_images.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomImage(
          imageType: ImagesType.asset,
            imagePath: AppImages.logoSmartShop,
        ),
      ),
    );
  }
}
