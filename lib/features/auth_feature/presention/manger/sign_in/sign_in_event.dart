import 'package:route_smart/features/auth_feature/data/models/sign_in/sign_in_request_model.dart';

abstract class SignInEvent {
  const SignInEvent();
}

class SignInStarted extends SignInEvent {
  const SignInStarted();
}

class SignInSubmitted extends SignInEvent {
  final SignInRequestModel request;

  const SignInSubmitted(this.request);
}