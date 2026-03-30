import 'package:flutter/material.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/reset_password_widgets/reset_password_form_sliver.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/reset_password_widgets/reset_password_header_slivers.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const ResetPasswordHeaderSliver(),
        
        const ResetPasswordFormSliver(),
        
        SliverToBoxAdapter(child: verticalSpace(40)),
      ],
    );
  }
}