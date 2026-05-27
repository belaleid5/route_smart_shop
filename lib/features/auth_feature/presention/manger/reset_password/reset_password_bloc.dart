import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/auth_feature/data/repo/auth_repo.dart';
import 'package:route_smart/features/auth_feature/presention/manger/reset_password/reset_password_event.dart';
import 'package:route_smart/features/auth_feature/presention/manger/reset_password/reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final AuthRepositoryImpl _authRepository;

  ResetPasswordBloc(this._authRepository) : super(const ResetPasswordInitial()) {
    on<ResetPasswordSubmitted>(_onResetPasswordSubmitted);
  }

  Future<void> _onResetPasswordSubmitted(
    ResetPasswordSubmitted event,
    Emitter<ResetPasswordState> emit,
  ) async {
    emit(const ResetPasswordLoading());

    final result = await _authRepository.resetPassword(event.request);
    switch (result) {
      case Success(:final data):
        emit(ResetPasswordSuccess(data));
      case Failure(:final message):
        emit(ResetPasswordError(message: message));
    }
  }
}