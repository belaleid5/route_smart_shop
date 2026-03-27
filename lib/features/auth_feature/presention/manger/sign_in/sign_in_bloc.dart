import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/auth_feature/data/repo/auth_repo.dart';
import 'package:route_smart/features/auth_feature/presention/manger/sign_in/sign_in_event.dart';
import 'package:route_smart/features/auth_feature/presention/manger/sign_in/sign_in_state.dart';


class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepositoryImpl _authRepository;

  SignInBloc(this._authRepository) : super(const SignInState.initial()) {
    
    on<SignInSubmitted>((event, emit) async {
      emit(const SignInState.loading());

      final result = await _authRepository.signIn(event.signInRequest);
      result.when(
        success: (registerResponse) {
          emit(SignInState.success(registerResponse));
        },
        failure: (errorMessage) {
          emit(SignInState.error(error: errorMessage));
        },
      );
    });
  }
}

