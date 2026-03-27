import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/auth_feature/data/repo/auth_repo.dart';
import 'package:route_smart/features/auth_feature/presention/manger/forgot_password/forgot_password_event.dart';
import 'package:route_smart/features/auth_feature/presention/manger/forgot_password/forgot_password_state.dart'
    show ForgotPasswordState;

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthRepositoryImpl _authRepository;

  ForgotPasswordBloc(this._authRepository)
    : super(const ForgotPasswordState.initial()) {
    on<ForgotPasswordSubmitted>((event, emit) async {
      emit(const ForgotPasswordState.loading());

      final result = await _authRepository.forgotPassword(
        event.forgotPasswordRequest,
      );
      result.when(
        success: (registerResponse) {
          emit(ForgotPasswordState.success(registerResponse));
        },
        failure: (errorMessage) {
          emit(ForgotPasswordState.error(error: errorMessage));
        },
      );
    });
  }
}
