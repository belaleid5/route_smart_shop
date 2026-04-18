import 'package:flutter/material.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/checkout/data/address_response_model.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_address_card.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_address_empty.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_address_header.dart';

class CheckoutAddressSection extends StatelessWidget {
  const CheckoutAddressSection({
    super.key,
    required this.addresses,
    required this.selectedAddress,
    required this.onAddressSelected,
    this.isLoading = false,
  });

  final List<AddressModel> addresses;
  final AddressModel? selectedAddress;
  final ValueChanged<AddressModel> onAddressSelected;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CheckoutAddressHeader(),
        verticalSpace(12),
        if (isLoading)
          const Center(child: CircularProgressIndicator())
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
