import 'package:flutter/material.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/helper/navigator_extenstion.dart';

class VerifyCodeHeaderSliver extends StatelessWidget {
  const VerifyCodeHeaderSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back, color: Color(0xFF1F2C37)),
              ),
            ),
          ),
          verticalSpace(20),
          // الـ Logo الحاوية البيضاء
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15)
              ],
            ),
            child: const Icon(Icons.shopping_bag, color: Color(0xFF4C53FF), size: 45),
          ),
          verticalSpace(30),
          const Text(
            'Verify Code',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          verticalSpace(15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              'Enter the 6-digit code sent to your email address.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
          verticalSpace(40),
        ],
      ),
    );
  }
}