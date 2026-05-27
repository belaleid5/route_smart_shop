import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';


class NavDivider extends StatelessWidget {
  const NavDivider({super.key, });



  @override
  Widget build(BuildContext context) {
    return Container(height: 16, width: 1, color: context.colors.divider);
  }
}
