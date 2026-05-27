import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/auth_feature/data/repo/auth_repo.dart';
import 'package:route_smart/features/auth_feature/presention/manger/sign_up/register_event.dart';
import 'package:route_smart/features/auth_feature/presention/manger/sign_up/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepositoryImpl _authRepository;

  RegisterBloc(this._authRepository) : super(const RegisterInitial()) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  Future<void> _onRegisterSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    emit(const RegisterLoading());

    final result = await _authRepository.register(event.request);

    switch (result) {
      case Success(:final data):
        emit(RegisterSuccess(data));
      case Failure(:final message):
        emit(RegisterError(message: message));
    }
  }
}