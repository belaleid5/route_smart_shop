import 'package:route_smart/features/auth_feature/data/models/reset_password/reset_password_request_model.dart';


abstract class ResetPasswordEvent {
  const ResetPasswordEvent();
}


class ResetPasswordStarted extends ResetPasswordEvent {
  const ResetPasswordStarted();
}

class ResetPasswordSubmitted extends ResetPasswordEvent {
  final ResetPasswordRequestModel request;

  const ResetPasswordSubmitted(this.request);
}