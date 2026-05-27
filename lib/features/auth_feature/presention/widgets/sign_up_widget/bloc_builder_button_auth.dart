import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/auth_feature/presention/manger/sign_up/register_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/sign_up/register_state.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/button_auth.dart';
// import 'package:route_smart/core/extensions/widget_animation_extension.dart';

class BlocBuilderButtonAuth extends StatelessWidget {
  const BlocBuilderButtonAuth({super.key, this.onSubmit});

  final Function()? onSubmit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
      
        final isLoading = state is RegisterLoading;

        return ButtonAuth(
          isLoading: isLoading,
          onSubmit: onSubmit,
          text: context.translate(LangKeys.signUp),
        )
            // .animateShimmer()
            ;
      },
    );
  }
}