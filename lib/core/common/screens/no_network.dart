import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/widgets/custom_image.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/core/styles/app_images.dart';

class NoNetwork extends StatelessWidget {
  const NoNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(
              imageType: ImagesType.svg,
              imagePath: AppImages.noNetwork,
            ),
            verticalSpace(20),
            Text(
              context.translate(LangKeys.noNetwork),
              style: context.titleMedium.copyWith(
                color: context.colors.textPrimary,
              ),
            ),
            verticalSpace(10),
            Text(
              context.translate(LangKeys.noNetworkMessage),
              style: context.bodyMedium.copyWith(
                color: context.colors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}