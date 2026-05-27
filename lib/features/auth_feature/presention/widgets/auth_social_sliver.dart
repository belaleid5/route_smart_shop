import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/widgets/custom_image.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/core/styles/app_images.dart';

class AuthSocialSliver extends StatelessWidget {
  const AuthSocialSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Divider(color: context.colors.divider)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    context.translate(LangKeys.orContinueWith).toUpperCase(),
                    style: context.textStyle.copyWith(
                      color: context.colors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ),
                Expanded(child: Divider(color: context.colors.divider)),
              ],
            ),
            verticalSpace(30),
            Row(
              spacing: 40,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialButton(context, AppImages.googleIcon),
                _buildSocialButton(context, AppImages.appleIcon),
              ],
            ).animateBottomToTop(),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(BuildContext context, String icon) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: context.colors.white,
        shape: BoxShape.circle,
      ),
      child: CustomImage(
        color: context.colors.white,

        height: 55,
        imageType: ImagesType.svg,
        imagePath: icon,
      ),
    );
  }
}
