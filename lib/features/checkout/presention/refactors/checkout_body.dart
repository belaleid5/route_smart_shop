import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_toast.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/cart/data/models/cart_item_model.dart';
import 'package:route_smart/features/checkout/data/address_response_model.dart';
import 'package:route_smart/features/checkout/data/shipping_address_model.dart';
import 'package:route_smart/features/checkout/presention/manger/checkout_bloc.dart';
import 'package:route_smart/features/checkout/presention/manger/checkout_event.dart';
import 'package:route_smart/features/checkout/presention/manger/checkout_state.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_address_section.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_app_bar.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_button.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_products_section.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_pyment_method.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_total_row.dart';

class CheckoutBody extends StatefulWidget {
  const CheckoutBody({
    super.key,
    required this.cartId,
    required this.cartItems,
    required this.totalPrice,
  });

  final String cartId;
  final List<CartItemModel> cartItems;
  final double totalPrice;

  @override
  State<CheckoutBody> createState() => _CheckoutBodyState();
}

class _CheckoutBodyState extends State<CheckoutBody> {
  AddressModel? _selectedAddress;

  void _onAddressSelected(AddressModel address) {
    setState(() => _selectedAddress = address);
  }

  void _handleCheckout() {
    if (_selectedAddress == null) {
      CustomToast.showError(
        context,
        context.translate(LangKeys.pleaseSelectAddress),
      );
      return;
    }

    context.read<CheckoutBloc>().add(
          CheckoutEvent.createCashOrder(
            cartId: widget.cartId,
            shippingAddress: ShippingAddressModel(
              details: _selectedAddress!.details ?? '',
              phone: _selectedAddress!.phone ?? '',
              city: _selectedAddress!.city ?? '',
            ),
          ),
        );
  }

  void _onOrderCreated() {
    CustomToast.showSuccess(
      context,
      context.translate(LangKeys.orderCreatedSuccess),
    );

    Navigator.of(context).pop();
  }

  void _autoSelectFirstAddress(List<AddressModel> addresses) {
    if (_selectedAddress != null || addresses.isEmpty) return;
    setState(() => _selectedAddress = addresses.first);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutBloc, CheckoutState>(
      listenWhen: (previous, current) => current.maybeWhen(
        addressesLoaded: (_) => true,
        orderCreated: (_) => true,
        error: (_) => true,
        orElse: () => false,
      ),
      listener: (context, state) {
        state.maybeWhen(
          addressesLoaded: _autoSelectFirstAddress,
          orderCreated: (_) => _onOrderCreated(),
          error: (message) => CustomToast.showError(context, context.translate(message)),
          orElse: () {},
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        final addresses = state.maybeWhen(
          addressesLoaded: (addresses) => addresses,
          orElse: () => <AddressModel>[],
        );

        return SafeArea(
          child: Column(
            children: [
              const CheckoutAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(16),
                      CheckoutAddressSection(
                        addresses: addresses,
                        selectedAddress: _selectedAddress,
                        onAddressSelected: _onAddressSelected,
                        isLoading: isLoading,
                      ).animateRightLeft(isFromStart: false),
                      verticalSpace(24),
                      CheckoutProductsSection(
                        cartItems: widget.cartItems,
                      ).animateBottomToTop(),
                      verticalSpace(24),
                      const CheckoutPaymentMethod()
                          .animateRightLeft(isFromStart: false),
                      verticalSpace(24),
                      CheckoutTotalRow(
                        totalAmount: widget.totalPrice,
                      ).animateBottomToTop(),
                      verticalSpace(20),
                      CheckoutButton(
                        onPressed: isLoading ? null : _handleCheckout,
                        isLoading: isLoading,
                      ).animateBottomToTop(),
                      verticalSpace(32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}