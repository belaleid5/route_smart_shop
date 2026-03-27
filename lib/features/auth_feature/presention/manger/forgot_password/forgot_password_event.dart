import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:route_smart/features/auth_feature/data/models/forgot_password/forgot_password_request_model.dart';

part 'forgot_password_event.freezed.dart';

@freezed
class ForgotPasswordEvent with _$ForgotPasswordEvent {
  const factory ForgotPasswordEvent.started() = _Started;
  const factory ForgotPasswordEvent.forgotPasswordSubmitted(
    ForgotPasswordRequestModel forgotPasswordRequest,
  ) = ForgotPasswordSubmitted;
}
