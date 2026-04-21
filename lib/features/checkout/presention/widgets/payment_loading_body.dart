import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class PaymentLoadingBody extends StatelessWidget {
  const PaymentLoadingBody({super.key, required this.colors});

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
        const SizedBox(height: 24),
        Text(
          'Processing...',
          style: TextStyle(fontSize: 18, color: colors.textSecondary),
        ),
      ],
    );
  }
}
