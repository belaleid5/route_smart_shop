import 'package:flutter/material.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/forgot_password_widgets/forgot_password_form_sliver.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/forgot_password_widgets/forgot_password_header.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const ForgotPasswordHeaderSliver(),
        const ForgotPasswordFormSliver(),
        SliverToBoxAdapter(child: verticalSpace(20)),
      ],
    );
  }
}
