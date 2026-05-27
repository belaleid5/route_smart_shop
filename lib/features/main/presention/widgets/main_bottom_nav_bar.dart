import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';

class MainBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const MainBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  Widget _buildItem(
    BuildContext context,
    int index,
    IconData icon,
    IconData activeIcon,
    String label,
  ) {
    final isActive = currentIndex == index;
    final colors = context.colors;

    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isActive ? activeIcon : icon,
                color: isActive ? colors.primary : colors.textSecondary,
                size: 24,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: context.textStyle.copyWith(
                  fontSize: 10,
                  fontWeight:
                      isActive ? FontWeight.w600 : FontWeight.w400,
                  color: isActive ? colors.primary : colors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      decoration: BoxDecoration(
        color: colors.surface.withOpacity(0.95),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
        border: Border.all(color: colors.stroke.withOpacity(0.5)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildItem(context, 0, Icons.home_outlined, Icons.home_rounded,
                  context.translate(LangKeys.home)),
              _buildItem(context, 1, Icons.search_outlined,
                  Icons.search_rounded, context.translate(LangKeys.search)),
              _buildItem(context, 2, Icons.favorite_border_rounded,
                  Icons.favorite_rounded, context.translate(LangKeys.wishlist)),
              _buildItem(context, 3, Icons.shopping_bag_outlined,
                  Icons.shopping_bag_rounded, context.translate(LangKeys.cart)),
              _buildItem(context, 4, Icons.person_outline_rounded,
                  Icons.person_rounded, context.translate(LangKeys.profile)),
            ],
          ),
        ),
      ),
    );
  }
}
