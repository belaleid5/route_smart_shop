import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/adabtive_text_form_field.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.label,
    required this.controller,
    this.readOnly = false,
    this.obscureText = false,
  });

  final String label;
  final TextEditingController controller;
  final bool readOnly;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return AdaptiveInputField(
      controller: controller,
      title: label,
      readOnly: readOnly,
      isPassword: obscureText,
      radius: 0, 
    context: context,
    );
  }
}