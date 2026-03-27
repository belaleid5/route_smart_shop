import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/widgets/adabtive_text_form_field.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/app_validators.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_toast.dart'; // تأكد من وجود الـ Toast هنا
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/routes/routes_names.dart';
import 'package:route_smart/features/auth_feature/data/models/forgot_password/forgot_password_request_model.dart';
import 'package:route_smart/features/auth_feature/presention/manger/forgot_password/forgot_password_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/forgot_password/forgot_password_event.dart';
import 'package:route_smart/features/auth_feature/presention/manger/forgot_password/forgot_password_state.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/forgot_password_widgets/bloc_builder_forgot_password_button_auth.dart';

class ForgotPasswordFormSliver extends StatefulWidget {
  const ForgotPasswordFormSliver({super.key});

  @override
  State<ForgotPasswordFormSliver> createState() =>
      _ForgotPasswordFormSliverState();
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
                    title: 'EMAIL ADDRESS',
                    hintText: 'name@example.com',
                    prefix: const Icon(Icons.email_outlined),
                    heightAfterIt: 30,
                    keyboardType: TextInputType.emailAddress,
                    validate: AppValidators.validateEmail,
                  ).animateBottomToTop(),

                  BlocBuilderForgotPasswordButtonAuth(onSubmit: _onSubmit),

                  verticalSpace(40),

                  TextButton.icon(
                    onPressed: () => context.pop(),
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 18,
                      color: Colors.black54,
                    ),
                    label: const Text(
                      'Back to Login',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ).animateBottomToTop(),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void _onStateChanged(BuildContext context, ForgotPasswordState state) {
    state.whenOrNull(
      success: (message) {
        CustomToast.showSuccess(
          context,
          message.message ?? "Reset code sent to your email",
        );
        context.pushReplacementNamed(AppRoutesNames.verifyCode);
      },
      error: (errorMessage) {
        CustomToast.showError(context, errorMessage);
      },
    );
  }
}
