import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/auth_feature/data/repo/auth_repo.dart';
import 'register_event.dart';
import 'register_state.dart';
// import 'package:route_smart/features/auth/domain/repositories/auth_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepositoryImpl _authRepository;

  RegisterBloc(this._authRepository) : super(const RegisterState.initial()) {
    
    on<RegisterSubmitted>((event, emit) async {
      emit(const RegisterState.loading());

      final result = await _authRepository.register(event.registerRequest);
      result.when(
        success: (registerResponse) {
          emit(RegisterState.success(registerResponse));
        },
        failure: (errorMessage) {
          emit(RegisterState.error(error: errorMessage));
        },
      );
    });
  }
}

