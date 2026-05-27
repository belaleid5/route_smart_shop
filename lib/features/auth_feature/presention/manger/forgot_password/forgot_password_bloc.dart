import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/auth_feature/data/repo/auth_repo.dart';
import 'package:route_smart/features/auth_feature/presention/manger/forgot_password/forgot_password_event.dart';
import 'package:route_smart/features/auth_feature/presention/manger/forgot_password/forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthRepositoryImpl _authRepository;

  ForgotPasswordBloc(this._authRepository) : super(const ForgotPasswordInitial()) {
    on<ForgotPasswordSubmitted>(_onForgotPasswordSubmitted);
  }

  Future<void> _onForgotPasswordSubmitted(
    ForgotPasswordSubmitted event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(const ForgotPasswordLoading());

    final result = await _authRepository.forgotPassword(event.request);

    switch (result) {
      case Success(:final data):
        emit(ForgotPasswordSuccess(data));
      case Failure(:final message):
        emit(ForgotPasswordError(message: message));
    }
  }
}