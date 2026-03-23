import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/widgets/custom_image.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/styles/app_images.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImage(
            imageType: ImagesType.svg,
            imagePath: AppImages.logoAppSvg,
          ).animateBottomToTop(
            duration: const Duration(milliseconds: 700),
          ),

          Text(
            'Route Smart',
            style: context.textStyle.copyWith(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ).animateBlur(
            duration: const Duration(milliseconds: 800),
          ),

          Text(
            'Smart Shopping Experience',
            style: context.textStyle.copyWith(
              letterSpacing: 2.8,
              color: context.colors.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ).animateRightLeft(
            duration: const Duration(milliseconds: 600),
            isFromStart: true,
          ),
        ],
      ),
    );
  }
}