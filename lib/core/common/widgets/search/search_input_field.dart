import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/adabtive_text_form_field.dart';
import 'package:route_smart/core/language/lang_keys.dart';

class SearchInputField extends StatelessWidget {
  const SearchInputField({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onSearch,
    this.readOnly = false,
    this.onTap,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSearch;
  final bool readOnly;
  final dynamic Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AdaptiveInputField(
      onTap: onTap,
      readOnly: readOnly,
      context: context,
      controller: controller,
      hintText: LangKeys.search,
      keyboardType: TextInputType.text,
      onSubmit: onSearch,
      onChange: onChanged,
      radius: 14,
      prefix: const Icon(Icons.search_rounded, size: 18),
      maxLines: 1,
      textCapitalization: TextCapitalization.none,
    );
  }
}