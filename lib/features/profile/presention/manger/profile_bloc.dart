import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/profile/domain/usecase/get_profile_usecase.dart';

import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase _getProfileUseCase;

  ProfileBloc(this._getProfileUseCase) : super(ProfileInitial()) {
    on<ProfileFetchRequested>(_onProfileFetchRequested);
  }

  Future<void> _onProfileFetchRequested(
    ProfileFetchRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileInProgress());
    final result = await _getProfileUseCase(event.userId);

    switch (result) {
      case Success(:final data):
        emit(ProfileSuccess(data));
        
      case Failure(:final message):
        emit(ProfileFailure(message));
    }
  }
}