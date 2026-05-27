import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/functions/spink_kit.dart';
import 'package:route_smart/core/language/lang_keys.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key, this.onPressed, this.isLoading = false});

  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed, 
        style: ElevatedButton.styleFrom(
          backgroundColor: context.colors.button,
          disabledBackgroundColor: context.colors.stroke.withValues(alpha: 0.5),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: isLoading
            ? loadingWidgetSpinKit(context)
            : Text(
                context.translate(LangKeys.checkoutNow),
                style: context.textStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: onPressed == null ? Colors.grey : Colors.white,
                ),
              ),
      ),
    );
  }
}