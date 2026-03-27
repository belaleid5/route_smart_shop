import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/widgets/custom_image.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/styles/app_images.dart';
import 'package:route_smart/core/routes/routes_names.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() {
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) {
        context.pushReplacementNamed(AppRoutesNames.signIn); 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 5,
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

          const SizedBox(height: 10),

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