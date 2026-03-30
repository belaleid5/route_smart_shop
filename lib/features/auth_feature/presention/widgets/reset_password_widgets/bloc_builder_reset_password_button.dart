import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/features/auth_feature/presention/manger/reset_password/reset_password_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/reset_password/reset_password_state.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/button_auth.dart';

class BlocBuilderResetPasswordButton extends StatelessWidget {
  const BlocBuilderResetPasswordButton({super.key, this.onPressed});

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return ButtonAuth(isLoading: isLoading, onSubmit: onPressed, text: 'Reset Password',).animateShimmer();
      },
    );
  }
}