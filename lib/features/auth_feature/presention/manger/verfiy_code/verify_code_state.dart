
import 'package:route_smart/features/auth_feature/data/models/verfication_code_model.dart/response_verification_code_model.dart';

abstract class VerifyCodeState {
  const VerifyCodeState();
}

class VerifyCodeInitial extends VerifyCodeState {
  const VerifyCodeInitial();
}

class VerifyCodeLoading extends VerifyCodeState {
  const VerifyCodeLoading();
}

class VerifyCodeSuccess extends VerifyCodeState {
  final VerificationCodeResponseModel data;

  const VerifyCodeSuccess(this.data);
}

class VerifyCodeError extends VerifyCodeState {
  final String message;

  const VerifyCodeError({required this.message});
}