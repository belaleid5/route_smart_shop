import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';

class WidgetCustomCheckBoxAgreeTerms extends StatefulWidget {
  const WidgetCustomCheckBoxAgreeTerms({super.key});

  @override
  State<WidgetCustomCheckBoxAgreeTerms> createState() => _WidgetCustomCheckBoxAgreeTermsState();
}

class _WidgetCustomCheckBoxAgreeTermsState extends State<WidgetCustomCheckBoxAgreeTerms> {
 bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _agreeToTerms,
          onChanged: (val) => setState(() => _agreeToTerms = val!),
          activeColor: const Color(0xFF6C63FF),
        ),
        const Expanded(
          child: Text(
            'By creating an account, you agree to our Terms and Privacy Policy',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
      ],
    ).animateBlur();
  }
}
