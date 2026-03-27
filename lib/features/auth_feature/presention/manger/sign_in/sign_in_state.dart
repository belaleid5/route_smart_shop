import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:route_smart/features/auth_feature/data/models/auth_response_model.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState<T> with _$SignInState<T> {
  const factory SignInState.initial() = _Initial;
  const factory SignInState.loading() = Loading;
  const factory SignInState.success(AuthResponseModel data) = Success<T>;
  const factory SignInState.error({required String error}) = Error;
}
