import 'package:flutter/material.dart';
import 'package:route_smart/features/checkout/presention/widgets/card_info.dart';

class CreditCardVisual extends StatelessWidget {
  const CreditCardVisual({
    super.key,
    required this.cardNumber,
    required this.holderName,
    required this.expiry,
    required this.cvv,
  });

  final String cardNumber;
  final String holderName;
  final String expiry;
  final String cvv;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFE8D5B7),
            Color(0xFFF5E6D3),
            Color(0xFFB8D4E3),
            Color(0xFFF4A460),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Credit',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    CircleAvatar(
                        radius: 12, backgroundColor: Colors.red.shade700),
                    Transform.translate(
                      offset: const Offset(-8, 0),
                      child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.orange.shade400),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              cardNumber,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardInfo(label: 'Card Holder', value: holderName),
                CardInfo(label: 'Expires', value: expiry),
                CardInfo(label: 'CVV', value: cvv),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
