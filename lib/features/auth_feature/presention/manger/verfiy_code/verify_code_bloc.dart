import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/auth_feature/data/repo/auth_repo.dart';
import 'package:route_smart/features/auth_feature/presention/manger/verfiy_code/verify_code_event.dart';
import 'package:route_smart/features/auth_feature/presention/manger/verfiy_code/verify_code_state.dart';

class VerifyCodeBloc extends Bloc<VerifyCodeEvent, VerifyCodeState> {
  final AuthRepositoryImpl _authRepository;

  VerifyCodeBloc(this._authRepository) : super(const VerifyCodeInitial()) {
    on<VerifyCodeSubmitted>(_onVerifyCodeSubmitted);
  }

  Future<void> _onVerifyCodeSubmitted(
    VerifyCodeSubmitted event,
    Emitter<VerifyCodeState> emit,
  ) async {
    emit(const VerifyCodeLoading());

    final result = await _authRepository.sendResetCode(event.request);

    switch (result) {
      case Success(:final data):
        emit(VerifyCodeSuccess(data));
      case Failure(:final message):
        emit(VerifyCodeError(message: message));
    }
  }
}