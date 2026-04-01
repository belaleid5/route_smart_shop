import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Row(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=44'),
            radius: 20,
          ).animateRightLeft(
            duration: const Duration(milliseconds: 300),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good morning,',
                style: context.textStyle.copyWith(
                  color: context.colors.textSecondary,
                  fontSize: 12,
                ),
              ).animateBottomToTop(
                duration: const Duration(milliseconds: 450),
              ),
              Text(
                'Jane!',
                style: context.textStyle.copyWith(
                  color: context.colors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ).animateBottomToTop(
                duration: const Duration(milliseconds: 600),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: context.colors.textSecondary),
            ),
            child: Icon(
              Icons.notifications_outlined,
              color: context.colors.textPrimary,
              size: 20,
            ),
          ),
          onPressed: () {},
        ).animateShakeAlarm(
          duration: const Duration(milliseconds: 300),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}