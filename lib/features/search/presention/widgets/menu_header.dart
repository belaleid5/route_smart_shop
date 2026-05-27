import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
      child: Row(spacing: 8,
        children: [
          Icon(
            Icons.category_outlined,
            size: 16,
            color: context.colors.primary,
          ),
        
          Text(
            context.translate(LangKeys.categories),
            style: context.textStyle.copyWith(
              fontSize: 13,
              fontWeight: FontWeightHelper.semiBold,
              color: context.colors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
