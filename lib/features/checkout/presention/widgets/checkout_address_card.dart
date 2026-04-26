import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/checkout/data/models/address_response_model.dart';

class CheckoutAddressCard extends StatelessWidget {
  const CheckoutAddressCard({
    super.key,
    required this.address,
    required this.isSelected,
  });

  final AddressModel address;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: context.color.shades,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? context.color.primary : context.color.stroke,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 70,
            decoration: BoxDecoration(
              color: context.color.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.location_on_rounded,
              color: Colors.red,
              size: 32,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address.name ?? 'Address',
                  style: context.textStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: context.color.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${address.details ?? ''}\n${address.city ?? ''} - ${address.phone ?? ''}',
                  style: context.textStyle.copyWith(
                    fontSize: 12,
                    color: context.color.textSecondary,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          if (isSelected)
            Icon(
              Icons.check_circle_rounded,
              color: context.color.primary,
              size: 24,
            ),
        ],
      ),
    );
  }
}
