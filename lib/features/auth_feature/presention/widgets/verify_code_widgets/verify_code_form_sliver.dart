import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_toast.dart'; //
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/auth_feature/data/models/verfication_code_model.dart/verification_code_request_model.dart';
import 'package:route_smart/features/auth_feature/presention/manger/verfiy_code/verify_code_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/verfiy_code/verify_code_event.dart';
import 'package:route_smart/features/auth_feature/presention/manger/verfiy_code/verify_code_state.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/verify_code_widgets/bloc_builder_auth_code.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/verify_code_widgets/text_resend_code.dart';

class VerifyCodeFormSliver extends StatefulWidget {
  const VerifyCodeFormSliver({super.key});

  @override
  State<VerifyCodeFormSliver> createState() => _VerifyCodeFormSliverState();
}

class _VerifyCodeFormSliverState extends State<VerifyCodeFormSliver> {
  final pinController = TextEditingController();

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (pinController.text.length == 5) {
      context.read<VerifyCodeBloc>().add(
        VerifyCodeSubmitted(
          VerificationCodeRequestModel(resetCode: pinController.text),
        ),
      );
    } else {
      CustomToast.showError(context, "Please enter the full 6-digit code");
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: context.color.primary),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          BlocListener<VerifyCodeBloc, VerifyCodeState>(
            listener: _onStateChanged,
            child: Column(
              children: [
                Center(
                  child: Pinput(
                    length: 5,
                    controller: pinController,
                    disabledPinTheme: defaultPinTheme,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        border: Border.all(
                          width: 1.5,
                          color: const Color(0xFF4C53FF),
                        ),
                      ),
                    ),
                    onCompleted: (_) => _onSubmit(),
                  ),
                ).animateBottomToTop(),

                verticalSpace(40),

              BlocBuilderAuthCode(onPressed: _onSubmit,).animateBottomToTop(),

                verticalSpace(30),

                TextResendCode().animateBottomToTop(),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void _onStateChanged(BuildContext context, VerifyCodeState state) {
    state.whenOrNull(
      success: (response) {
        CustomToast.showSuccess(context, "Code Verified Successfully!");
        // context.pushNamed(AppRoutesNames.resetPassword);
      },
      error: (errorMessage) {
        CustomToast.showError(context, errorMessage);
        pinController.clear();
      },
    );
  }
}

