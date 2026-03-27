import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/auth_feature/data/repo/auth_repo.dart';
import 'package:route_smart/features/auth_feature/presention/manger/verfiy_code/verify_code_event.dart';
import 'package:route_smart/features/auth_feature/presention/manger/verfiy_code/verify_code_state.dart';

class VerifyCodeBloc
    extends Bloc<VerifyCodeEvent, VerifyCodeState> {
  final AuthRepositoryImpl _authRepository;

  VerifyCodeBloc(this._authRepository)
    : super(const VerifyCodeState.initial()) {
    on<VerifyCodeSubmitted>((event, emit) async {
      emit(const VerifyCodeState.loading());

      final result = await _authRepository.sendResetCode(
        event.VerifyCodeRequest,
      );
      result.when(
        success: (response) {
          emit(VerifyCodeState.success(response));
        },
        failure: (errorMessage) {
          emit(VerifyCodeState.error(error: errorMessage));
        },
      );
    });
  }
}
