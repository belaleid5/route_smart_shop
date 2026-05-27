import 'package:route_smart/features/profile/domain/entites/user_entity.dart';


sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileInProgress extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final UserEntity user;
  
  ProfileSuccess(this.user);
}

final class ProfileFailure extends ProfileState {
  final String message;
  
  ProfileFailure(this.message);
}