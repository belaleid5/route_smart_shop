import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:route_smart/features/auth_feature/data/models/verfication_code_model.dart/verification_code_request_model.dart';

part 'verify_code_event.freezed.dart';

@freezed
class VerifyCodeEvent with _$VerifyCodeEvent {
  const factory VerifyCodeEvent.started() = _Started;
  const factory VerifyCodeEvent.verifyCodeSubmitted(
    VerificationCodeRequestModel VerifyCodeRequest,
  ) = VerifyCodeSubmitted;
}
