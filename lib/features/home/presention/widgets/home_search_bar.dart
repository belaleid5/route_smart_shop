import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/widgets/adabtive_text_form_field.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';

class HomeSearchBar extends StatelessWidget {
  final TextEditingController controller;
  const HomeSearchBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AdaptiveInputField(
      context: context,
      controller: controller,
      hintText: 'Search products, brands...',
      prefix: Icon(Icons.search, color: context.colors.primary),
      radius: 30.0,
    ).animateBottomToTop(duration: const Duration(milliseconds: 600));
    
  }
}
