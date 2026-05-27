import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_toast.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/cart/domain/entites/cart_item_entity.dart';
import 'package:route_smart/features/checkout/domain/entites/address_entity.dart';
import 'package:route_smart/features/checkout/domain/entites/shipping_address_entity.dart';
import 'package:route_smart/features/checkout/presention/manger/checkout_bloc.dart';
import 'package:route_smart/features/checkout/presention/manger/checkout_event.dart';
import 'package:route_smart/features/checkout/presention/manger/checkout_state.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_address_section.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_address_sheet.dart';
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
  final List<CartItemEntity> cartItems;
  final double totalPrice;

  @override
  State<CheckoutBody> createState() => _CheckoutBodyState();
}

class _CheckoutBodyState extends State<CheckoutBody> {
  AddressEntity? _selectedAddress;
  PaymentMethod _selectedPaymentMethod = PaymentMethod.cash;
  List<AddressEntity> _cachedAddresses = [];

  @override
  void initState() {
    super.initState();
    context.read<CheckoutBloc>().add(const GetAddressesEvent());
  }

  void _onAddressSelected(AddressEntity address) =>
      setState(() => _selectedAddress = address);

  void _onPaymentMethodChanged(PaymentMethod method) =>
      setState(() => _selectedPaymentMethod = method);

  void _handleCheckout() {
    if (_selectedAddress == null) {
      CustomToast.showError(
        context,
        context.translate(LangKeys.pleaseSelectAddress),
      );
      return;
    }

    final shippingAddress = ShippingAddressEntity(
      details: _selectedAddress!.details ?? '',
      phone: _selectedAddress!.phone ?? '',
      city: _selectedAddress!.city ?? '',
    );

    final bloc = context.read<CheckoutBloc>();

    if (_selectedPaymentMethod == PaymentMethod.cash) {
      bloc.add(
        CreateCashOrderEvent(
          cartId: widget.cartId,
          shippingAddress: shippingAddress,
        ),
      );
    } else {
      bloc.add(
        PayWithCardEvent(
          amount: widget.totalPrice,
          cartId: widget.cartId,
          shippingAddress: shippingAddress,
        ),
      );
    }
  }

  void _handleAddressesLoaded(List<AddressEntity> addresses) {
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
      listenWhen: (_, current) =>
          current is CheckoutAddressesLoaded ||
          current is CheckoutOrderCreated ||
          current is CheckoutPaymentSuccess ||
          current is CheckoutError,
      listener: (context, state) {
        switch (state) {
          case CheckoutAddressesLoaded(:final addresses):
            _handleAddressesLoaded(addresses);
          case CheckoutOrderCreated():
            showPaymentResultDialog(context, isSuccess: true);
          case CheckoutPaymentSuccess():
            showPaymentResultDialog(context, isSuccess: true);
          case CheckoutError(:final message):
            CustomToast.showError(context, message);
          default:
            break;
        }
      },
      builder: (context, state) {
        final isLoading =
            state is CheckoutLoading || state is CheckoutProcessingPayment;

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
                        addresses: _cachedAddresses,
                        selectedAddress: _selectedAddress,
                        onAddressSelected: _onAddressSelected,
                        isLoading: isLoading,
                        onAddAddress: () =>
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: context.colors.background,
                              builder: (_) => BlocProvider.value(
                                value: context.read<CheckoutBloc>(),
                                child: const CheckoutAddAddressSheet(),
                              ),
                            ).then((_) {
                              context.read<CheckoutBloc>().add(
                                const GetAddressesEvent(),
                              );
                            }),
                      ).animateRightLeft(isFromStart: false),
                      verticalSpace(24),
                      CheckoutProductsSection(
                        cartItems: widget.cartItems,
                      ).animateBottomToTop(),
                      verticalSpace(24),
                      CheckoutPaymentMethod(
                        selectedMethod: _selectedPaymentMethod,
                        onMethodChanged: _onPaymentMethodChanged,
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
