import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/widgets/custom_image.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/styles/app_images.dart';

import 'package:route_smart/core/language/lang_keys.dart';


class RegisterHeaderSliver extends StatelessWidget {
  const RegisterHeaderSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImage(
                  height: 100,
                  imageType: ImagesType.svg,
                  color: context.colors.primary,
                  imagePath: AppImages.logoAppSvg,
                ),
               
              ],
            ).animateBottomToTop(),
            
            verticalSpace(40),
            
            Text(
              context.translate(LangKeys.createAccount), 
              style: context.textStyle.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ).animateRightLeft(),
            
            verticalSpace(8),
            
            Text(
              context.translate(LangKeys.signUpWelcome), 
              style: context.textStyle.copyWith(
                fontSize: 16,
                color: context.colors.textSecondary,
              ),
            ).animateRightLeft(),
          ],
        ),
      ),
    );
  }
}
