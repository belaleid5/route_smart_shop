import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/auth_feature/data/repo/auth_repo.dart';
import 'package:route_smart/features/auth_feature/presention/manger/sign_in/sign_in_event.dart';
import 'package:route_smart/features/auth_feature/presention/manger/sign_in/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepositoryImpl _authRepository;

  SignInBloc(this._authRepository) : super(const SignInInitial()) {
    on<SignInSubmitted>(_onSignInSubmitted);
  }

  Future<void> _onSignInSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    emit(const SignInLoading());

    final result = await _authRepository.signIn(event.request);

    switch (result) {
      case Success(:final data):
        emit(SignInSuccess(data));
      case Failure(:final message):
        emit(SignInError(message: message));
    }
  }
}