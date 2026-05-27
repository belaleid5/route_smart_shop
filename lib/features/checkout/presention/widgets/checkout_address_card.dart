import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/checkout/domain/entites/address_entity.dart';

class CheckoutAddressCard extends StatelessWidget {
  final AddressEntity address; 
  final bool isSelected;

  const CheckoutAddressCard({
    super.key,
    required this.address,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? context.colors.primary : context.colors.stroke,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address.name ?? '',
                  style: context.textStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colors.textPrimary,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  address.details ?? '',
                  style: context.textStyle.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  address.phone ?? '',
                  style: context.textStyle.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.location_on, color: context.colors.primary),
        ],
      ),
    );
  }
}
