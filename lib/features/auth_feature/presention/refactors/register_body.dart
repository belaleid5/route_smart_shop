// features/auth/presentation/views/register_view.dart
import 'package:flutter/widgets.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/auth_social_sliver.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/sign_up_widget/register_form_sliver.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/sign_up_widget/sign_in_header.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SignInHeaderSliver(),
        const RegisterFormSliver(),
        const AuthSocialSliver(),
        SliverToBoxAdapter(child: verticalSpace(20)),
      ],
    );
  }
}
