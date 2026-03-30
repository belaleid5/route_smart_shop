import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:route_smart/features/auth_feature/data/models/reset_password/reset_password_request_model.dart';

part 'reset_password_event.freezed.dart';

@freezed
class ResetPasswordEvent with _$ResetPasswordEvent {
  const factory ResetPasswordEvent.started() = _Started;
  const factory ResetPasswordEvent.resetPasswordSubmitted(
    ResetPasswordRequestModel resetPasswordRequest,
  ) = ResetPasswordSubmitted;
}
