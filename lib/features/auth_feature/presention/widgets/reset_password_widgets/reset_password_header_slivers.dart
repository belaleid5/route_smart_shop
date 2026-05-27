import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/widgets/custom_image.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/core/styles/app_images.dart';

class ResetPasswordHeaderSliver extends StatelessWidget {
  const ResetPasswordHeaderSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          verticalSpace(60),
          CustomImage(
            imageType: ImagesType.svg,
            imagePath: AppImages.logoAppSvg,
            height: 120,
          ),
          verticalSpace(30),
          Text(
            context.translate(LangKeys.resetPassword),
            style: context.titleLarge.copyWith(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpace(12),
          Text(
            context.translate(LangKeys.resetPasswordSubtitle),
            textAlign: TextAlign.center,
            style: context.bodyMedium.copyWith(
              color: context.colors.textSecondary,
              fontSize: 15,
              height: 1.5,
            ),
          ),
          verticalSpace(30),
        ],
      ),
    );
  }
}
