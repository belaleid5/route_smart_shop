// lib/features/checkout/presention/widgets/checkout_payment_method.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';

enum PaymentMethod { cash, card }

class CheckoutPaymentMethod extends StatelessWidget {
  const CheckoutPaymentMethod({
    super.key,
    required this.selectedMethod,
    required this.onMethodChanged,
  });

  final PaymentMethod? selectedMethod;
  final ValueChanged<PaymentMethod> onMethodChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.translate(LangKeys.paymentMethod),
          style: context.textStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: context.colors.textPrimary,
          ),
        ),
        verticalSpace(12),
        _PaymentMethodCard(
          icon: Icons.money_rounded,
          iconColor: context.colors.button,
          iconBg: context.colors.fieldBackground,
          title: context.translate(LangKeys.cashOnDelivery),
          subtitle: context.translate(LangKeys.payOnReceive),
          isSelected: selectedMethod == PaymentMethod.cash,
          onTap: () => onMethodChanged(PaymentMethod.cash),
        ),
        verticalSpace(12),
        _PaymentMethodCard(
          icon: Icons.credit_card_rounded,
          iconColor: context.colors.button,
          iconBg: context.colors.fieldBackground,
          title: context.translate(LangKeys.creditCard),
          subtitle: context.translate(LangKeys.paySecurelyStripe),
          isSelected: selectedMethod == PaymentMethod.card,
          onTap: () => onMethodChanged(PaymentMethod.card),
        ),
      ],
    );
  }
}

class _PaymentMethodCard extends StatelessWidget {
  const _PaymentMethodCard({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected
              ? context.colors.fieldBackground.withValues(alpha: 0.5)
              : context.colors.shades,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? context.colors.button : context.colors.stroke,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: context.colors.button.withValues(alpha: 0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.textStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: context.colors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: context.textStyle.copyWith(
                      fontSize: 12,
                      color: context.colors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) =>
                  ScaleTransition(scale: animation, child: child),
              child: Container(
                key: ValueKey(isSelected),
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      isSelected ? context.colors.button : Colors.transparent,
                  border: Border.all(
                    color: isSelected
                        ? context.colors.button
                        : context.colors.textSecondary.withValues(alpha: 0.3),
                    width: 2,
                  ),
                ),
                child: isSelected
                    ? const Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 16,
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
