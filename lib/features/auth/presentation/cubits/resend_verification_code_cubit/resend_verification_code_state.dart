part of 'resend_verification_code_cubit.dart';

abstract class ResendVerificationState  {
  const ResendVerificationState();
}

class ResendVerificationInitial extends ResendVerificationState {}

class ResendVerificationLoading extends ResendVerificationState {}

class ResendVerificationSuccess extends ResendVerificationState {
  final String message;
  const ResendVerificationSuccess(this.message);
}

class ResendVerificationFailure extends ResendVerificationState {
  final String errorMessage;
  const ResendVerificationFailure(this.errorMessage);
}
