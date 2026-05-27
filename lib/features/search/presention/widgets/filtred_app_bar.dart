import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class FilteredAppBar extends StatelessWidget {
  const FilteredAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      color: context.colors.background,
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: context.colors.primary,
            ),

            onPressed: context.pop,
          ),
          Expanded(child: Text(title, style: context.titleMedium)),
        ],
      ),
    );
  }
}
