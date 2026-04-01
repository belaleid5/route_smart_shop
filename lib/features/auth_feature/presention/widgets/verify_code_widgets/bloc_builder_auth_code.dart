import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/features/auth_feature/presention/manger/verfiy_code/verify_code_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/verfiy_code/verify_code_state.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/button_auth.dart';

class BlocBuilderAuthCode extends StatelessWidget {
  const BlocBuilderAuthCode({super.key, this.onPressed});
  final void Function() ? onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyCodeBloc, VerifyCodeState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return ButtonAuth(
          isLoading: isLoading,
          onSubmit: onPressed, text: 'Verify Code',
        ).animateShimmer();
      },
    );
  }
}
