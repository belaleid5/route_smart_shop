import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/widgets/custom_image.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/core/styles/app_images.dart';

class VerifyCodeHeaderSliver extends StatelessWidget {
  const VerifyCodeHeaderSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => context.pop(),
                icon: Icon(Icons.arrow_back, color: context.colors.textPrimary),
              ),
            ),
          ),
          verticalSpace(20),
          CustomImage(
            imageType: ImagesType.svg,
            imagePath: AppImages.logoAppSvg,
          ),
          verticalSpace(30),
          Text(
            context.translate(LangKeys.verifyCode),
            style: context.textStyle.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpace(15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              context.translate(LangKeys.verifyCodeSubtitle),
              textAlign: TextAlign.center,
              style: context.textStyle.copyWith(
                color: context.colors.textSecondary,
                fontSize: 16,
              ),
            ),
          ),
          verticalSpace(40),
        ],
      ),
    );
  }
}
