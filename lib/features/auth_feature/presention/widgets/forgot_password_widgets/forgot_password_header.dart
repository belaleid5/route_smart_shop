import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/widgets/custom_image.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/core/styles/app_images.dart';

class ForgotPasswordHeaderSliver extends StatelessWidget {
  const ForgotPasswordHeaderSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          verticalSpace(60),
          CustomImage(
            imageType: ImagesType.svg,
            imagePath: AppImages.logoAppSvg,
          ),
          verticalSpace(24),
          Text(
            context.translate(LangKeys.forgotPassword),
            style: context.titleLarge.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpace(12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              context.translate(LangKeys.forgotPasswordSubtitle),
              textAlign: TextAlign.center,
              style: context.bodyMedium.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.5,
                color: context.colors.textSecondary,
              ),
            ),
          ),
          verticalSpace(30),
        ],
      ),
    );
  }
}