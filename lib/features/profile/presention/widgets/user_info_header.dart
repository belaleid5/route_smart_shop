import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/profile/domain/entites/user_entity.dart';

class UserInfoHeader extends StatelessWidget {
  final UserEntity user;
  const UserInfoHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 110,
          height: 110,
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
            boxShadow: [
              BoxShadow(
                color: context.colors.primary.withOpacity(0.25),
                blurRadius: 15,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            user.initial,
            style: context.textStyle.copyWith(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: context.colors.white,
            ),
          ),
        ),

        verticalSpace(20),

        Text(
          user.displayName,
          style: context.textStyle.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: context.colors.textPrimary,
          ),
        ),

        verticalSpace(6),

        Text(
          user.displayEmail,
          style: context.textStyle.copyWith(
            fontSize: 15,
            color: context.colors.textSecondary,
          ),
        ),
      ],
    );
  }
}
