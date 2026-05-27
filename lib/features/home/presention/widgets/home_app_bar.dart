// features/home/presentation/widgets/home_app_bar.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/profile/presention/manger/profile_bloc.dart';
import 'package:route_smart/features/profile/presention/manger/profile_state.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  static const double _avatarSeparator = 12;
  static const double _iconPadding = 8;
  static const double _iconSize = 20;
  static const double _iconSeparator = 8;

  static const Duration _animationFast = Duration(milliseconds: 300);

  static const Duration _animationSlow = Duration(milliseconds: 600);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,

      title: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is! ProfileSuccess) {
            return const SizedBox.shrink();
          }

          final user = state.user;

          return Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      context.colors.primary,
                      context.colors.primary.withOpacity(0.8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  user.initial,
                  style: context.textStyle.copyWith(
                    color: context.colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ).animateRightLeft(duration: _animationFast),

              SizedBox(width: _avatarSeparator),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      user.displayName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textStyle.copyWith(
                        color: context.colors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ).animateBottomToTop(duration: _animationSlow),

                    if (user.displayEmail.isNotEmpty)
                      Text(
                        user.displayEmail,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyle.copyWith(
                          color: context.colors.textSecondary,
                          fontSize: 11,
                        ),
                      ).animateBottomToTop(duration: _animationSlow),
                  ],
                ),
              ),
            ],
          );
        },
      ),

      actions: [
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(_iconPadding),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: context.colors.textSecondary),
            ),
            child: Icon(
              Icons.notifications_outlined,
              color: context.colors.textPrimary,
              size: _iconSize,
            ),
          ),
          onPressed: () {},
          tooltip: context.translate(LangKeys.notifications),
        ).animateShakeAlarm(duration: _animationFast),

        const SizedBox(width: _iconSeparator),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
