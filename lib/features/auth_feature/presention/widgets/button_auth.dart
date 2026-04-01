import 'package:flutter/material.dart';
import 'package:route_smart/core/common/functions/spink_kit.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

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
        backgroundColor: context.color.primary,
        disabledBackgroundColor: context.color.primary,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: isLoading
          ? loadingWidget(context)
          : Text(
              text,
              style: context.textStyle.copyWith(
                color: context.color.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
