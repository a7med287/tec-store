part of 'edit_profile_cubit.dart';

abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {
  final EditProfileEntity entity;
  EditProfileSuccess(this.entity);
}

class EditProfileFailure extends EditProfileState {
  final String error;
  EditProfileFailure(this.error);
}
