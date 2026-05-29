import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/widgets/adabtive_text_form_field.dart';
import 'package:route_smart/core/common/widgets/custom_form_password.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/app_validators.dart';
import 'package:route_smart/core/extensions/custom_toast.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/core/routes/routes_names.dart';
import 'package:route_smart/features/auth_feature/data/models/sign_in/sign_in_request_model.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

import 'package:route_smart/features/auth_feature/presention/manger/sign_in/sign_in_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/sign_in/sign_in_event.dart';
import 'package:route_smart/features/auth_feature/presention/manger/sign_in/sign_in_state.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/custom_text_go_to.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/sign_in_widget/bloc_builder_sign_in.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/sign_in_widget/section_forget_password.dart';

class SignInFormSliver extends StatefulWidget {
  const SignInFormSliver({super.key});

  @override
  State<SignInFormSliver> createState() => _SignInFormSliverState();
}

class _SignInFormSliverState extends State<SignInFormSliver> {
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
    if (!_formKey.currentState!.validate()) return;
 if (context.read<SignInBloc>().isClosed) return;
    final request = SignInRequestModel(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );

    context.read<SignInBloc>().add(SignInSubmitted(request));
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          BlocListener<SignInBloc, SignInState>(
            listener: _onStateChanged,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AdaptiveInputField(
                    context: context,
                    controller: _emailController,
                    title: context.translate(LangKeys.emailAddress).toUpperCase(),
                    hintText: 'name@example.com',
                    heightAfterIt: 20,
                    keyboardType: TextInputType.emailAddress,
                    validate: AppValidators.validateEmail,
                  ).animateBottomToTop(),

                  CustomTextFormPassword(
                    controller: _passwordController,
                    title: context.translate(LangKeys.password).toUpperCase(),
                    hintText: '••••••••',
                    heightAfterIt: 30,
                    validate: AppValidators.validatePassword,
                  ).animateBottomToTop(),
                  
                  SectionForgetPassword().animateBottomToTop(),
                  verticalSpace(10), 

                  BlocBuilderSignInButtonAuth(onSubmit: _onSubmit),

                  verticalSpace(25),

                  CustomTexGoTo(
                    onTap: () => context.pushReplacementNamed(AppRoutesNames.register),
                    title: context.translate(LangKeys.dontHaveAccount),
                    textNextTo: context.translate(LangKeys.signUp),
                  ).animateBottomToTop(),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void _onStateChanged(BuildContext context, SignInState state) {
    switch (state) {
      case SignInSuccess():
     
        final msg = state.data.message ?? context.translate(LangKeys.welcome);
        CustomToast.showSuccess(context, msg);
        
      
        context.pushNamedAndRemoveUntil(AppRoutesNames.mainScreen);
      
      case SignInError():
        CustomToast.showError(context, state.message);
      
      default:
        break; // Ignore Initial and Loading
    }
  }
}