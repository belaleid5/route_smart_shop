import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/features/checkout/presention/widgets/app_logo.dart';
import 'package:route_smart/features/checkout/presention/widgets/bottom_nav_links.dart';
import 'package:route_smart/features/checkout/presention/widgets/loading_content.dart';
import 'package:route_smart/features/checkout/presention/widgets/payment_success_body.dart';

Future<void> showPaymentResultDialog(
  BuildContext context, {
  required bool isSuccess,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black54,
    builder: (_) => PaymentResultDialog(isSuccess: isSuccess),
  );
}

class PaymentResultDialog extends StatelessWidget {
  const PaymentResultDialog({super.key, required this.isSuccess});

  final bool isSuccess;

  static const double _widthFactor = 0.70 * 2;
  static const double _heightFactor = 0.65;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final size = MediaQuery.sizeOf(context);

    return Dialog(
      backgroundColor: colors.background,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      child: SizedBox(
        width: size.width * _widthFactor,
        height: size.height * _heightFactor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
          child: Column(
            children: [
              AppLogo(colors: colors),
              const Spacer(),
              isSuccess
                  ? PaymentSuccessBody(colors: colors)
                  : LoadingContent(colors: colors),

              const Spacer(),

              if (isSuccess) BottomNavLinks(colors: colors),
            ],
          ),
        ),
      ),
    );
  }
}
