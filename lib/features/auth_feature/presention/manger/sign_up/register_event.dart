import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:route_smart/features/auth_feature/data/models/sign_up/register_request_model.dart';
// import 'package:route_smart/features/auth/data/models/register_request.dart';

part 'register_event.freezed.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.started() = _Started;
  const factory RegisterEvent.registerSubmitted(RegisterRequestModel registerRequest) = RegisterSubmitted;
}