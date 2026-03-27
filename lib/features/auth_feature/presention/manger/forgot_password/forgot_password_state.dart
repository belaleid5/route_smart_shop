import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:route_smart/features/auth_feature/data/models/message_response_model.dart';

part 'forgot_password_state.freezed.dart';

@freezed
class ForgotPasswordState<T> with _$ForgotPasswordState<T> {
  const factory ForgotPasswordState.initial() = _Initial;
  const factory ForgotPasswordState.loading() = Loading;
  const factory ForgotPasswordState.success(MessageResponseModel data) =
      Success<T>;
  const factory ForgotPasswordState.error({required String error}) = Error;
}
