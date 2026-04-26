import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class CheckoutAppBar extends StatelessWidget {
  const CheckoutAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: IconButton(
              onPressed: () => context.pop(),
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: context.color.textPrimary,
              ),
            ),
          ),
          Text(
            'Payment',
            style: context.textStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: context.color.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}