import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/features/checkout/data/models/shipping_address_model.dart';
import 'package:route_smart/features/checkout/presention/manger/checkout_bloc.dart';
import 'package:route_smart/features/checkout/presention/manger/checkout_event.dart';
import 'package:route_smart/features/checkout/presention/manger/checkout_state.dart';
import 'package:route_smart/features/checkout/presention/refactors/checkout_body.dart';
import 'package:route_smart/features/checkout/presention/widgets/payemnt_result.dart';

class PaymentDetailsPage extends StatefulWidget {
  const PaymentDetailsPage({
    super.key,
    required this.amount,
    required this.cartId,
    required this.shippingAddress,
  });

  final double amount;
  final String cartId;
  final ShippingAddressModel shippingAddress;

  @override
  State<PaymentDetailsPage> createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  final _cardController = TextEditingController(text: '1234 5678 1234 5678');
  final _nameController = TextEditingController(text: 'Sam Louis');
  final _expiryController = TextEditingController(text: '07/29');
  final _cvvController = TextEditingController(text: '215');

  @override
  void dispose() {
    _cardController.dispose();
    _nameController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _handlePay() {
    // Process payment with bloc
    context.read<CheckoutBloc>().add(
      CheckoutEvent.payWithCard(
        amount: widget.amount,
        cartId: widget.cartId,
        shippingAddress: widget.shippingAddress,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Payment Details'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: colors.textPrimary),
        titleTextStyle: TextStyle(
          color: colors.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: BlocListener<CheckoutBloc, CheckoutState>(
        listener: (context, state) {
          state.whenOrNull(
            paymentSuccess: () {
              showPaymentResultDialog(context, isSuccess: true);
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
            },
          );
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card Visual
              _buildCardVisual(colors),
              const SizedBox(height: 32),

              // Form Fields
              _buildField('Card Number', _cardController),
              const SizedBox(height: 20),
              _buildField('Card Holder', _nameController),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _buildField('Expiry Date', _expiryController),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildField('CVV', _cvvController, obscure: true),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Pay Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _handlePay,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Pay \$${widget.amount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardVisual(MyColors colors) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [colors.primary.withOpacity(0.8), colors.primary],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              _cardController.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _nameController.text,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  _expiryController.text,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(
    String label,
    TextEditingController controller, {
    bool obscure = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: context.colors.textSecondary, fontSize: 14),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: context.colors.divider),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: context.colors.primary),
            ),
          ),
        ),
      ],
    );
  }
}