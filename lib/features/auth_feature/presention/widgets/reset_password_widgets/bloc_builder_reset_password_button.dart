import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/auth_feature/presention/manger/reset_password/reset_password_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/reset_password/reset_password_state.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/button_auth.dart';
// import 'package:route_smart/core/extensions/widget_animation_extension.dart'; // تأكد من وجود هذا الاستيراد

class BlocBuilderResetPasswordButton extends StatelessWidget {
  const BlocBuilderResetPasswordButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, state) {
        final isLoading = state is ResetPasswordLoading;

        return ButtonAuth(
          isLoading: isLoading,
          onSubmit: onPressed,
          text: context.translate(LangKeys.resetPassword),
        )
           
            ;
      },
    );
  }
}