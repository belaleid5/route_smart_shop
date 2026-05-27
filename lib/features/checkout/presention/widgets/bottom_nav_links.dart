import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/app_cubit/app_cubit_cubit.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/core/routes/routes_names.dart';
import 'package:route_smart/features/checkout/presention/widgets/nav_divider.dart';
import 'package:route_smart/features/checkout/presention/widgets/nav_link.dart';

class BottomNavLinks extends StatelessWidget {
  const BottomNavLinks({super.key, required this.colors});

  final MyColors colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        NavLink(
          label: context.translate(LangKeys.home),
          colors: colors,
          onTap: () {
            context.read<AppCubit>().changeTab(0); 
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutesNames.mainScreen,
              (route) => false,
            );
          },
        ),
        NavDivider(),
        NavLink(
          label: context.translate(LangKeys.myOrder),
          colors: colors,
          onTap: () {
            context.read<AppCubit>().changeTab(3); 
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutesNames.mainScreen,
              (route) => false,
            );
          },
        ),
        NavDivider(),
        NavLink(
          label: context.translate(LangKeys.profile),
          colors: colors,
          onTap: () {
            context.read<AppCubit>().changeTab(4); 
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutesNames.mainScreen,
              (route) => false,
            );
          },
        ),
      ],
    );
  }
}