import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.label,
    required this.controller,
    required this.colors,
    this.readOnly = false,
    this.obscureText = false,
  });

  final String label;
  final TextEditingController controller;
  final MyColors colors;
  final bool readOnly;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: colors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          readOnly: readOnly,
          obscureText: obscureText,
          style: TextStyle(
            color: colors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: colors.primary),
            ),
            contentPadding: const EdgeInsets.only(bottom: 8),
          ),
        ),
      ],
    );
  }
}
