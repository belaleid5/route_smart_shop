import 'package:flutter/material.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/verify_code_widgets/verify_code_form_sliver.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/verify_code_widgets/verify_code_header_sliver.dart';

class VerifyCodeBody extends StatelessWidget {
  const VerifyCodeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const VerifyCodeHeaderSliver(),
        const VerifyCodeFormSliver(),
        SliverToBoxAdapter(child: verticalSpace(40)),
      ],
    );
  }
}