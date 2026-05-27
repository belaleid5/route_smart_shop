import 'package:route_smart/features/auth_feature/data/models/sign_up/register_request_model.dart';

abstract class RegisterEvent {
  const RegisterEvent();
}

class RegisterStarted extends RegisterEvent {
  const RegisterStarted();
}

class RegisterSubmitted extends RegisterEvent {
  final RegisterRequestModel request;

  const RegisterSubmitted(this.request);
}