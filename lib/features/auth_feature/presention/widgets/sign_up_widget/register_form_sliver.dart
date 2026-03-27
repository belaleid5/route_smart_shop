import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/widgets/adabtive_text_form_field.dart';
import 'package:route_smart/core/common/widgets/custom_form_password.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/app_validators.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_toast.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/routes/routes_names.dart';
import 'package:route_smart/features/auth_feature/data/models/sign_up/register_request_model.dart';
import 'package:route_smart/features/auth_feature/presention/manger/sign_up/register_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/sign_up/register_event.dart';
import 'package:route_smart/features/auth_feature/presention/manger/sign_up/register_state.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/sign_up_widget/bloc_builder_button_auth.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/sign_up_widget/custom_form_field_phone_number.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/custom_text_go_to.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/sign_up_widget/widget_custom_check_box_agree_terms.dart';

class RegisterFormSliver extends StatefulWidget {
  const RegisterFormSliver({super.key});

  @override
  State<RegisterFormSliver> createState() => _RegisterFormSliverState();
}

class _RegisterFormSliverState extends State<RegisterFormSliver> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;

    final request = RegisterRequestModel(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text,
      rePassword: _confirmPasswordController.text,
      phone: _phoneController.text.trim(),
    );

    context.read<RegisterBloc>().add(RegisterSubmitted(request));
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          BlocListener<RegisterBloc, RegisterState>(
            listener: _onStateChanged,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AdaptiveInputField(
                    context: context,
                    controller: _nameController,
                    title: 'Full Name',
                    hintText: 'Ahmed Abd Al-Muti',
                    prefix: const Icon(Icons.person_outline),
                    heightAfterIt: 20,
                    validate: AppValidators.validateFullName,
                  ).animateBottomToTop(),

                  AdaptiveInputField(
                    context: context,
                    controller: _emailController,
                    title: 'Email Address',
                    hintText: 'ahmedmuttii4012@gmail.com',
                    prefix: const Icon(Icons.email_outlined),
                    heightAfterIt: 20,
                    keyboardType: TextInputType.emailAddress,
                    validate: AppValidators.validateEmail,
                  ).animateBottomToTop(),

                  CustomFormFieldPhoneNumber(
                    phoneController: _phoneController,
                  ).animateBottomToTop(),

                  CustomTextFormPassword(
                    controller: _passwordController,
                    title: 'Password',
                    hintText: 'Ahmed@123',
                    heightAfterIt: 20,
                    validate: AppValidators.validatePassword,
                  ).animateBottomToTop(),

                  CustomTextFormPassword(
                    controller: _confirmPasswordController,
                    title: 'Confirm Password',
                    isConfirmPassword: true,
                    heightAfterIt: 15,
                    validate: (value) => AppValidators.validateConfirmPassword(
                      value,
                      _passwordController.text,
                    ),
                  ).animateBottomToTop(),

                  const WidgetCustomCheckBoxAgreeTerms(),

                  const SizedBox(height: 25),

                  BlocBuilderButtonAuth(onSubmit: _onSubmit),

                  verticalSpace(25),

                  CustomTexGoTo(
                    onTap: () =>
                        context.pushReplacementNamed(AppRoutesNames.signIn),
                  ).animateBottomToTop(),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void _onStateChanged(BuildContext context, RegisterState state) {
    state.whenOrNull(
      success: (data) {
        CustomToast.showSuccess(
          context,
          data.message ?? "Account Created Successfully",
        );
            context.pushNamedAndRemoveUntil(AppRoutesNames.signIn);
      },
      error: (message) {
        CustomToast.showError(context, message);
      },
    );
  }
}
