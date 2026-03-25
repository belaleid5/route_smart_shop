// features/auth/presentation/views/register_view.dart
import 'package:flutter/widgets.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/register_form_sliver.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/register_header_siver.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/reister_social_sliver.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const RegisterHeaderSliver(),
        const RegisterFormSliver(),
        const RegisterSocialSliver(),
        SliverToBoxAdapter(child: verticalSpace(20)),
      ],
    );
  }
}
