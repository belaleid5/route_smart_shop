import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/features/auth_feature/presention/manger/forgot_password/forgot_password_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/forgot_password/forgot_password_state.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/button_auth.dart';

class BlocBuilderForgotPasswordButtonAuth extends StatelessWidget {
  const BlocBuilderForgotPasswordButtonAuth({super.key, this.onSubmit});

  final Function()? onSubmit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      builder: (context, state) {
  
        final isLoading = state is ForgotPasswordLoading;

        return ButtonAuth(
          isLoading: isLoading,
          onSubmit: onSubmit,
          text: 'Send Reset',
        ).animateShimmer();
      },
    );
  }
}