import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/widgets/adabtive_text_form_field.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/app_validators.dart';
import 'package:route_smart/core/extensions/custom_toast.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/core/routes/routes_names.dart';
import 'package:route_smart/features/auth_feature/data/models/forgot_password/forgot_password_request_model.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/auth_feature/presention/manger/forgot_password/forgot_password_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/forgot_password/forgot_password_event.dart';
import 'package:route_smart/features/auth_feature/presention/manger/forgot_password/forgot_password_state.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/forgot_password_widgets/bloc_builder_forgot_password_button_auth.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/reset_password_widgets/go_to_text_button_to_login.dart';

class ForgotPasswordFormSliver extends StatefulWidget {
  const ForgotPasswordFormSliver({super.key});

  @override
  State<ForgotPasswordFormSliver> createState() => _ForgotPasswordFormSliverState();
}

class _ForgotPasswordFormSliverState extends State<ForgotPasswordFormSliver> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      context.read<ForgotPasswordBloc>().add(
        ForgotPasswordSubmitted(
          ForgotPasswordRequestModel(email: _emailController.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
            listener: _onStateChanged,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AdaptiveInputField(
                    context: context,
                    controller: _emailController,
                    title: context.translate(LangKeys.email),
                    hintText: 'name@example.com',
                    prefix: const Icon(Icons.email_outlined),
                    heightAfterIt: 30,
                    keyboardType: TextInputType.emailAddress,
                    validate: AppValidators.validateEmail,
                  ).animateBottomToTop(),

                  BlocBuilderForgotPasswordButtonAuth(onSubmit: _onSubmit),

                  verticalSpace(40),

                  const GotTextButtonToLogin().animateBottomToTop(),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void _onStateChanged(BuildContext context, ForgotPasswordState state) {
    switch (state) {
      case ForgotPasswordSuccess():
        final msg = state.data.message ?? "Reset code sent to your email";
        CustomToast.showSuccess(context, msg);
        context.pushReplacementNamed(AppRoutesNames.verifyCode);
      case ForgotPasswordError():
        CustomToast.showError(context, state.message);
      default:
        break; // Ignore Initial and Loading states in listener
    }
  }
}