import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/custom_image.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
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
            'Forgot Password',
            style: context.textStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpace(12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Don't worry! Enter the email address associated with your account and we'll send you a link to reset your password.",
              textAlign: TextAlign.center,
              style: context.textStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.5,
                color: context.color.textSecondary,
              ),
            ),
          ),
          verticalSpace(30),
        ],
      ),
    );
  }
}
