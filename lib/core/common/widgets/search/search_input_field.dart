
import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/adabtive_text_form_field.dart';

class SearchInputField extends StatelessWidget {
  const SearchInputField({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onSearch,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSearch;

  @override
  Widget build(BuildContext context) {
    return AdaptiveInputField(
      context: context,
      controller: controller,
      hintText: 'Search...',
      keyboardType: TextInputType.text,
      onSubmit: onSearch,
      onChange: onChanged,
      radius: 14,
      prefix: const Icon(
        Icons.search_rounded,
        size: 18,
      ),
      maxLines: 1,
      textCapitalization: TextCapitalization.none,
    );
  }
}