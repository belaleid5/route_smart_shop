import 'package:route_smart/features/auth_feature/data/models/auth_response_model.dart';

abstract class SignInState {
  const SignInState();
}

class SignInInitial extends SignInState {
  const SignInInitial();
}

class SignInLoading extends SignInState {
  const SignInLoading();
}

class SignInSuccess extends SignInState {
  final AuthResponseModel data;

  const SignInSuccess(this.data);
}

class SignInError extends SignInState {
  final String message;

  const SignInError({required this.message});
}