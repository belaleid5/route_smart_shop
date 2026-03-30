import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/custom_image.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/styles/app_images.dart';

class ResetPasswordHeaderSliver extends StatelessWidget {
  const ResetPasswordHeaderSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          verticalSpace(60),
          // اللوجو (Container الـ Shadow)
          CustomImage(
            imageType: ImagesType.svg,
            imagePath: AppImages.logoAppSvg,
            height: 120,
          ),
          verticalSpace(30),
           Text(
            'Reset Password',
            style: context.textStyle.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpace(12),
          Text(
            'Enter your email and create a new\nsecure password.',
            textAlign: TextAlign.center,
            style: context.textStyle.copyWith(
              color: context.color.textSecondary,
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
