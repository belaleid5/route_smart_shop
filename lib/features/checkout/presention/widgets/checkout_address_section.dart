import 'package:flutter/material.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/checkout/domain/entites/address_entity.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_address_card.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_address_empty.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_address_header.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_address_shimmer.dart';

class CheckoutAddressSection extends StatelessWidget {
  const CheckoutAddressSection({
    super.key,
    required this.addresses,
    required this.selectedAddress,
    required this.onAddressSelected,
    required this.onAddAddress,
    this.isLoading = false,
  });

  final List<AddressEntity> addresses; 
  final AddressEntity? selectedAddress; 
  final ValueChanged<AddressEntity> onAddressSelected; 
  final VoidCallback onAddAddress;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckoutAddressHeader(onAddAddress: onAddAddress),
        verticalSpace(12),
        if (isLoading)
          const CheckoutAddressShimmer()
        else if (addresses.isEmpty)
          const CheckoutAddressEmpty()
        else
          Column(
            children: addresses.map((address) {
              final isSelected = address.id == selectedAddress?.id;
              return GestureDetector(
                onTap: () => onAddressSelected(address),
                child: CheckoutAddressCard(
                  address: address,
                  isSelected: isSelected,
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}
