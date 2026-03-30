import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/widgets/adabtive_text_form_field.dart';
import 'package:route_smart/core/common/widgets/custom_form_password.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/app_validators.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_toast.dart'; // تأكد من استيراد التوست
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/routes/routes_names.dart';
import 'package:route_smart/features/auth_feature/data/models/reset_password/reset_password_request_model.dart';
import 'package:route_smart/features/auth_feature/presention/manger/reset_password/reset_password_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/reset_password/reset_password_event.dart';
import 'package:route_smart/features/auth_feature/presention/manger/reset_password/reset_password_state.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/reset_password_widgets/bloc_builder_reset_password_button.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/reset_password_widgets/go_to_text_button_to_login.dart';

class ResetPasswordFormSliver extends StatefulWidget {
  const ResetPasswordFormSliver({super.key});

  @override
  State<ResetPasswordFormSliver> createState() =>
      _ResetPasswordFormSliverState();
}

class _ResetPasswordFormSliverState extends State<ResetPasswordFormSliver> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      context.read<ResetPasswordBloc>().add(
        ResetPasswordSubmitted(
          ResetPasswordRequestModel(
            email: _emailController.text.trim(),
            newPassword: _passwordController.text,
          ),
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
          BlocListener<ResetPasswordBloc, ResetPasswordState>(
            listener: _onStateChanged,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AdaptiveInputField(
                    context: context,
                    controller: _emailController,
                    title: 'EMAIL ADDRESS',
                    hintText: 'name@example.com',
                    prefix: const Icon(Icons.email_outlined),
                    heightAfterIt: 20,
                    keyboardType: TextInputType.emailAddress,
                    validate: AppValidators.validateEmail,
                  ).animateBottomToTop(),

                  CustomTextFormPassword(
                    title: "New Password",
                    hintText: "New Password",
                    controller: _passwordController,
                  ).animateBottomToTop(),

                  verticalSpace(10),

                  BlocBuilderResetPasswordButton(
                    onPressed: _onSubmit,
                  ).animateBottomToTop(),

                  verticalSpace(24),

                  GotTextButtonToLogin().animateBottomToTop(),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void _onStateChanged(BuildContext context, ResetPasswordState state) {
    state.whenOrNull(
      success: (response) {
        CustomToast.showSuccess(context, "Password Updated Successfully!");
        context.pushNamedAndRemoveUntil(AppRoutesNames.signIn);
      },
      error: (errorMessage) {
        CustomToast.showError(context, errorMessage);
      },
    );
  }
}
