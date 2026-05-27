import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/widgets/custom_image.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';
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
                  color: context.colors.primary,
                  imagePath: AppImages.logoAppSvg,
                )
                .animateScaleNFadeHorizontal(
                  duration: const Duration(milliseconds: 800),
                )
                .animateBlur(duration: const Duration(milliseconds: 600)),

            verticalSpace(40),

            Text(
              context.translate(LangKeys.welcomeBack),
              style: context.textStyle.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ).animateBottomToTop(duration: const Duration(milliseconds: 600)),

            verticalSpace(8),

            Text(
              context.translate(LangKeys.signInToContinue),
              style: context.textStyle.copyWith(
                fontSize: 16,
                color: context.colors.textSecondary,
              ),
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
