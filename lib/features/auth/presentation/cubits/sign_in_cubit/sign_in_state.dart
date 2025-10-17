part of 'sign_in_cubit.dart';

abstract class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {
  final UserEntity userEntity;

  SignInSuccess({required this.userEntity});
}

final class SignInFailure extends SignInState {
  final String errorMessage;

  SignInFailure({required this.errorMessage});
}
class SignInEmailNotConfirmed extends SignInState {
  final UserEntity userEntity;
  SignInEmailNotConfirmed({required this.userEntity});
}
