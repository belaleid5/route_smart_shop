import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';

class HeaderSection extends StatelessWidget {
  final String title;
  final VoidCallback? onTapSeeAll;

  const HeaderSection({
    super.key,
    required this.title,
    this.onTapSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.textStyle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (onTapSeeAll != null) 
            GestureDetector(
              onTap: onTapSeeAll,
              child: Text(
                context.translate(LangKeys.seeAll),
                style: TextStyle(
                  color: context.colors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}