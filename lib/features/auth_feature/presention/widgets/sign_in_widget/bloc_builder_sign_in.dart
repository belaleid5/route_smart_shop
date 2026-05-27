import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/auth_feature/presention/manger/sign_in/sign_in_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/sign_in/sign_in_state.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/button_auth.dart';

class BlocBuilderSignInButtonAuth extends StatelessWidget {
  const BlocBuilderSignInButtonAuth({super.key, this.onSubmit});

  final Function()? onSubmit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
       
        final isLoading = state is SignInLoading;

        return ButtonAuth(
          isLoading: isLoading,
          onSubmit: onSubmit,
          text: context.translate(LangKeys.login),
        )
            
            ;
      },
    );
  }
}