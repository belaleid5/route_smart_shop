import 'package:route_smart/features/auth_feature/data/models/message_response_model.dart';


abstract class ForgotPasswordState {
  const ForgotPasswordState();
}


class ForgotPasswordInitial extends ForgotPasswordState {
  const ForgotPasswordInitial();
}

class ForgotPasswordLoading extends ForgotPasswordState {
  const ForgotPasswordLoading();
}

class ForgotPasswordSuccess extends ForgotPasswordState {
  final MessageResponseModel data;

  const ForgotPasswordSuccess(this.data);
}

class ForgotPasswordError extends ForgotPasswordState {
  final String message;

  const ForgotPasswordError({required this.message});
}