import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

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
            title ?? 'Already have an account? ',
            style: context.textStyle.copyWith(
              fontSize: 14,
              color: context.color.textSecondary,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              textNextTo ?? 'Login',
              style: context.textStyle.copyWith(
                fontSize: 14,
                color: context.color.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
