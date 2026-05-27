import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';

class CustomTexGoTo extends StatelessWidget {
  const CustomTexGoTo({
    super.key,
    this.textNextTo,
    this.title,
    required this.onTap,
  });

  final String? textNextTo;
  final String? title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title ?? context.translate(LangKeys.youHaveAccount),
            style: context.textStyle.copyWith(
              fontSize: 14,
              color: context.colors.textSecondary,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              textNextTo ?? context.translate(LangKeys.login),
              style: context.textStyle.copyWith(
                fontSize: 14,
                color: context.colors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
