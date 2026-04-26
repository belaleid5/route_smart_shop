import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_toast.dart';
import 'package:route_smart/core/helper/navigator_extenstion.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/routes/routes_names.dart';
import 'package:route_smart/features/auth_feature/data/models/verfication_code_model.dart/verification_code_request_model.dart';
import 'package:route_smart/features/auth_feature/presention/manger/verfiy_code/verify_code_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/verfiy_code/verify_code_event.dart';
import 'package:route_smart/features/auth_feature/presention/manger/verfiy_code/verify_code_state.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/verify_code_widgets/bloc_builder_auth_code.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/verify_code_widgets/text_resend_code.dart';

class VerifyCodeFormSliver extends StatefulWidget {
  final int otpLength;

  const VerifyCodeFormSliver({
    super.key,
    this.otpLength = 6,
  }); 

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
    if (pinController.text.length == widget.otpLength) {
      context.read<VerifyCodeBloc>().add(
        VerifyCodeSubmitted(
          VerificationCodeRequestModel(resetCode: pinController.text),
        ),
      );
    } else {
      CustomToast.showError(
        context,
        "Please enter the full ${widget.otpLength}-digit code",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: widget.otpLength == 6 ? 50 : 60,
      height: 60,
      textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F4F7),
        border: Border.all(
          width: 0.5,
          color: context.color.primary.withOpacity(0.3),
        ),
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
                    length: widget.otpLength,
                    controller: pinController,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        border: Border.all(
                          width: 1.5,
                          color: context.color.primary,
                        ),
                      ),
                    ),
                    onCompleted: (_) => _onSubmit(),
                  ),
                ).animateBottomToTop(),

                verticalSpace(40),

                BlocBuilderAuthCode(onPressed: _onSubmit).animateBottomToTop(),

                verticalSpace(30),

                const TextResendCode().animateBottomToTop(),
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
        context.pushNamed(AppRoutesNames.reset_password);
      },
      error: (errorMessage) {
                CustomToast.showError(context, context.translate(errorMessage));
;
        pinController.clear(); 
      },
    );
  }
}
