import 'package:route_smart/features/auth_feature/data/models/forgot_password/forgot_password_request_model.dart';

abstract class ForgotPasswordEvent {
  const ForgotPasswordEvent();
}

class ForgotPasswordStarted extends ForgotPasswordEvent {
  const ForgotPasswordStarted();
}

class ForgotPasswordSubmitted extends ForgotPasswordEvent {
  final ForgotPasswordRequestModel request;

  const ForgotPasswordSubmitted(this.request);
}