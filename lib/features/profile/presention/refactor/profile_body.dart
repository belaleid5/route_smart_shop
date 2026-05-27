import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/app_cubit/app_cubit_cubit.dart';
import 'package:route_smart/core/app/app_cubit/app_state.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/profile/domain/entites/user_entity.dart';
import '../widgets/language_dialog.dart';
import '../widgets/profile_menu_item.dart';
import '../widgets/user_info_header.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (prev, curr) =>
          prev.isDark != curr.isDark || prev.languageCode != curr.languageCode,
      builder: (context, state) {
        final cubit = context.read<AppCubit>();
        final isDark = state.isDark;
        final langCode = state.languageCode;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              UserInfoHeader(user: user),

              verticalSpace( 30),

              ProfileMenuItem(
                title: context.translate(LangKeys.wishlist),
                icon: Icons.favorite_border_rounded,
                onTap: () => cubit.changeTab(2),
              ),

              verticalSpace( 12),

              ProfileMenuItem(
                title: context.translate(LangKeys.cart),
                icon: Icons.shopping_cart_outlined,
                onTap: () => cubit.changeTab(3),
              ),

              const Divider(height: 40),

              ProfileMenuItem(
                title: context.translate(LangKeys.language),
                icon: Icons.language_rounded,
                trailing: Text(
                  langCode == 'ar'
                      ? context.translate(LangKeys.arabic)
                      : context.translate(LangKeys.english),
                  style: TextStyle(color: context.colors.primary),
                ),
                onTap: () => showLanguageDialog(context, langCode),
              ),

              verticalSpace( 12),

              ProfileMenuItem(
                title: context.translate(LangKeys.darkMode),
                icon: Icons.dark_mode_outlined,
                trailing: Switch(
                  value: isDark,
                  onChanged: (_) => cubit.toggleTheme(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}