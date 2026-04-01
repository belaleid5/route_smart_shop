import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/auth_feature/data/repo/auth_repo.dart';
import 'package:route_smart/features/auth_feature/presention/manger/reset_password/reset_password_event.dart';
import 'package:route_smart/features/auth_feature/presention/manger/reset_password/reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final AuthRepositoryImpl _authRepository;

  ResetPasswordBloc(this._authRepository)
    : super(const ResetPasswordState.initial()) {
    on<ResetPasswordSubmitted>((event, emit) async {
      emit(const ResetPasswordState.loading());

      final result = await _authRepository.resetPassword(
        event.resetPasswordRequest,
      );
      result.when(
        success: (registerResponse) {
          emit(ResetPasswordState.success(registerResponse));
        },
        failure: (errorMessage) {
          emit(ResetPasswordState.error(error: errorMessage));
        },
      );
    });
  }
}
