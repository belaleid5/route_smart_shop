// features/auth_feature/presention/refactors/login_body.dart

import 'package:flutter/widgets.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/sign_up_widget/register_header_siver.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/auth_social_sliver.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/sign_in_widget/sign_in_form_sliver.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/sign_up_widget/sign_in_header.dart';


class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SignInHeaderSliver(), 
        const SignInFormSliver(),
        const AuthSocialSliver(), 
        SliverToBoxAdapter(child: verticalSpace(20)),
      ],
    );
  }
}