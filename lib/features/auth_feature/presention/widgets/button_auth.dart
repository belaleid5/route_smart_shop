import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:route_smart/core/common/functions/spink_kit.dart';

class ButtonAuth extends StatelessWidget {
  const ButtonAuth({
    super.key,
    required this.isLoading,
    this.onSubmit,
    required this.text,
  });

  final bool isLoading;
  final String text;
  final Function()? onSubmit;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? () {} : onSubmit,
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colors.primary,
        disabledBackgroundColor: context.colors.primary,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: isLoading
          ? loadingWidgetSpinKit(context)
          : Text(
              text,
              style: context.textStyle.copyWith(
                color: context.colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}