import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:route_smart/features/auth_feature/data/models/verfication_code_model.dart/response_verification_code_model.dart';

part 'verify_code_state.freezed.dart';

@freezed
class VerifyCodeState<T> with _$VerifyCodeState<T> {
  const factory VerifyCodeState.initial() = _Initial;
  const factory VerifyCodeState.loading() = Loading;
  const factory VerifyCodeState.success(VerificationCodeResponseModel data) =
      Success<T>;
  const factory VerifyCodeState.error({required String error}) = Error;
}
