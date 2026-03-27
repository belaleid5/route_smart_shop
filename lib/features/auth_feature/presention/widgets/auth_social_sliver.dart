import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/custom_image.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
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
                const Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'OR CONTINUE WITH',
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                  ),
                ),
                const Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              spacing: 40,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialButton(
                  'Google',
                  AppImages.googleIcon,
                  context.color.primary,
                ),
                _buildSocialButton(
                  'iOS Apple',
                  AppImages.appleIcon,
                  context.color.primary,
                ),
              ],
            ).animateBottomToTop(),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(String label, String icon, Color? color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: CustomImage(
        color: color,
        applySvgColor: true,
        height: 55,
        imageType: ImagesType.svg,
        imagePath: icon,
      ),
    );
  }
}
