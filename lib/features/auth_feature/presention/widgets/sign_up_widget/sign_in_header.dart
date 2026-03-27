import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/custom_image.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/styles/app_images.dart';

class SignInHeaderSliver extends StatelessWidget {
  const SignInHeaderSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImage(
                  height: 100,
                  imageType: ImagesType.svg,
                  color: context.color.primary,
                  imagePath: AppImages.logoAppSvg,
                )
                .animateScaleNFadeHorizontal(
                  duration: const Duration(milliseconds: 800),
                )
                .animateBlur(duration: const Duration(milliseconds: 600)),

            const SizedBox(height: 40),

            Text(
              'Welcome Back',
              style: context.textStyle.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ).animateBottomToTop(duration: const Duration(milliseconds: 600)),

            const SizedBox(height: 8),

            Text(
              'Sign in to continue shopping',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ).animateRightLeft(
              duration: const Duration(milliseconds: 500),
              isFromStart: false,
            ),
          ],
        ),
      ),
    );
  }
}
