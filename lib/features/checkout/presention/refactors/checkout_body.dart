import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_toast.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/cart/data/models/cart_item_model.dart';
import 'package:route_smart/features/checkout/data/models/address_response_model.dart';
import 'package:route_smart/features/checkout/data/models/shipping_address_model.dart';
import 'package:route_smart/features/checkout/presention/manger/checkout_bloc.dart';
import 'package:route_smart/features/checkout/presention/manger/checkout_event.dart';
import 'package:route_smart/features/checkout/presention/manger/checkout_state.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_address_section.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_app_bar.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_button.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_products_section.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_pyment_method.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_total_row.dart';
import 'package:route_smart/features/checkout/presention/widgets/payemnt_result.dart';

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
  PaymentMethod _selectedPaymentMethod = PaymentMethod.cash; // ✅ استخدم الـ imported
  List<AddressModel> _cachedAddresses = [];

  void _onAddressSelected(AddressModel address) {
    setState(() => _selectedAddress = address);
  }

  void _onPaymentMethodChanged(PaymentMethod method) {
    setState(() => _selectedPaymentMethod = method);
  }

  void _handleCheckout() {
    if (_selectedAddress == null) {
      CustomToast.showError(
        context,
        context.translate(LangKeys.pleaseSelectAddress),
      );
      return;
    }

    final shippingAddress = ShippingAddressModel(
      details: _selectedAddress!.details ?? '',
      phone: _selectedAddress!.phone ?? '',
      city: _selectedAddress!.city ?? '',
    );

    if (_selectedPaymentMethod == PaymentMethod.cash) {
      context.read<CheckoutBloc>().add(
            CheckoutEvent.createCashOrder(
              cartId: widget.cartId,
              shippingAddress: shippingAddress,
            ),
          );
    } else {
      showPaymentResultDialog(context, isSuccess: true);
    }
  }

  void _autoSelectFirstAddress(List<AddressModel> addresses) {
    if (addresses.isNotEmpty) {
      setState(() {
        _cachedAddresses = addresses;
        _selectedAddress ??= addresses.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutBloc, CheckoutState>(
      listenWhen: (previous, current) => current.maybeWhen(
        addressesLoaded: (_) => true,
        orderCreated: (_) => true,
        paymentSuccess: () => true,
        error: (_) => true,
        orElse: () => false,
      ),
      listener: (context, state) {
        state.maybeWhen(
          addressesLoaded: _autoSelectFirstAddress,
          orderCreated: (_) {
            showPaymentResultDialog(context, isSuccess: true);
          },
          paymentSuccess: () {
            showPaymentResultDialog(context, isSuccess: true);
          },
          error: (message) {
            CustomToast.showError(context, message);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          processingPayment: () => true,
          orElse: () => false,
        );

        final addresses = state.maybeWhen(
          addressesLoaded: (fresh) {
            if (fresh.isNotEmpty) _cachedAddresses = fresh;
            return _cachedAddresses;
          },
          orElse: () => _cachedAddresses,
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
                      CheckoutPaymentMethod(
                        selectedMethod: _selectedPaymentMethod,
                        onMethodChanged: _onPaymentMethodChanged, // ✅ دلوقتي مطابق
                      ).animateRightLeft(isFromStart: false),
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