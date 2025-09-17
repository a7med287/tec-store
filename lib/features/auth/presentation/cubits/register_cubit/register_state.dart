part of 'register_cubit.dart';

abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final String email;

  RegisterSuccess({required this.email});
}

final class RegisterFailure extends RegisterState {
  final String errorMessage;

  RegisterFailure({required this.errorMessage});
}
