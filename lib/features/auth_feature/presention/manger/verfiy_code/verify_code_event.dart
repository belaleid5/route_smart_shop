
import 'package:route_smart/features/auth_feature/data/models/verfication_code_model.dart/verification_code_request_model.dart';

abstract class VerifyCodeEvent {
  const VerifyCodeEvent();
}

class VerifyCodeStarted extends VerifyCodeEvent {
  const VerifyCodeStarted();
}

class VerifyCodeSubmitted extends VerifyCodeEvent {
  final VerificationCodeRequestModel request;

  const VerifyCodeSubmitted(this.request);
}