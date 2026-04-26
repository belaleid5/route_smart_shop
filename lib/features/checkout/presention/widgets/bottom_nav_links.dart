import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
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
          label: 'Home',
          colors: colors,
          onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutesNames.mainScreen,
            (route) => false,
          ),
        ),
        NavDivider(colors: colors),
        NavLink(
          label: 'My Orders',
          colors: colors,
          onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutesNames.mainScreen,
            (route) => false,
            arguments: 1,
          ),
        ),
        NavDivider(colors: colors),
        NavLink(
          label: 'Profile',
          colors: colors,
          onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutesNames.mainScreen,
            (route) => false,
            arguments: 3,
          ),
        ),
      ],
    );
  }
}
