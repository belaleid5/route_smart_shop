import 'package:route_smart/features/auth_feature/data/models/auth_response_model.dart';

abstract class RegisterState {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  const RegisterInitial();
}

class RegisterLoading extends RegisterState {
  const RegisterLoading();
}

class RegisterSuccess extends RegisterState {
  final AuthResponseModel data;

  const RegisterSuccess(this.data);
}

class RegisterError extends RegisterState {
  final String message;

  const RegisterError({required this.message});
}