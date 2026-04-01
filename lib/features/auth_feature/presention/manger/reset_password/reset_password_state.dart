import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:route_smart/features/auth_feature/data/models/reset_password/reset_password_response.dart';

part 'reset_password_state.freezed.dart';

@freezed
class ResetPasswordState<T> with _$ResetPasswordState<T> {
  const factory ResetPasswordState.initial() = _Initial;
  const factory ResetPasswordState.loading() = Loading;
  const factory ResetPasswordState.success(ResetPasswordResponse data) =
      Success<T>;
  const factory ResetPasswordState.error({required String error}) = Error;
}
