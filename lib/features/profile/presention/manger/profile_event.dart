sealed class ProfileEvent {}

final class ProfileFetchRequested extends ProfileEvent {
  final String userId;
  
  ProfileFetchRequested({required this.userId});
}