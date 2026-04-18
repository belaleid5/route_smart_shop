import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';

class CheckoutPaymentMethod extends StatelessWidget {
  const CheckoutPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Method',
          style: context.textStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: context.color.textPrimary,
          ),
        ),
        verticalSpace(12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: context.color.shades,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: context.color.textSecondary.withValues(alpha: 0.2),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: context.color.background,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Text(
                  '💳',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cash on Delivery',
                      style: context.textStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: context.color.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Pay when you receive the order',
                      style: context.textStyle.copyWith(
                        fontSize: 13,
                        color: context.color.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.check_circle_rounded,
                color: context.color.button,
                size: 24,
              ),
            ],
          ),
        ),
      ],
    );
  }
}