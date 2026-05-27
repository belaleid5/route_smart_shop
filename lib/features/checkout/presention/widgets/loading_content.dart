import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';

// ✅ دمجنا LoadingContent و PaymentLoadingBody في widget واحد
class LoadingContent extends StatelessWidget {
  const LoadingContent({super.key, required this.colors});

  final MyColors colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: CircularProgressIndicator(
            strokeWidth: 4,
            color: colors.primary,
          ),
        ),
       verticalSpace( 24),
        Text(
          context.translate(LangKeys.processingPayment),
          style: TextStyle(fontSize: 18, color: colors.textSecondary),
        ),
       verticalSpace( 8),
        Text(
          context.translate(LangKeys.pleaseWait), 
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: colors.textPrimary,
          ),
        ),
      ],
    );
  }
}
