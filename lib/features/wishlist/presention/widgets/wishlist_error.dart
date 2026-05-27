import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';

class WishlistErrorView extends StatelessWidget {
  const WishlistErrorView({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off_rounded,
            size: 80,
            color: context.colors.stroke,
          ),
          verticalSpace(16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: context.bodyMedium,
          ),
          verticalSpace(24),
          ElevatedButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: Text(context.translate(LangKeys.retry)),
          ),
        ],
      ),
    );
  }
}