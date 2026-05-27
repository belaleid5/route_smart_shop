import 'package:route_smart/features/auth_feature/data/models/reset_password/reset_password_response.dart';


abstract class ResetPasswordState {
  const ResetPasswordState();
}

class ResetPasswordInitial extends ResetPasswordState {
  const ResetPasswordInitial();
}

class ResetPasswordLoading extends ResetPasswordState {
  const ResetPasswordLoading();
}

class ResetPasswordSuccess extends ResetPasswordState {
  final ResetPasswordResponse data;

  const ResetPasswordSuccess(this.data);
}

class ResetPasswordError extends ResetPasswordState {
  final String message;

  const ResetPasswordError({required this.message});
}