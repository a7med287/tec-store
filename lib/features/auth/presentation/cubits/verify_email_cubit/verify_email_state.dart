part of 'verify_email_cubit.dart';


abstract class VerifyEmailState {}

final class VerifyEmailInitial extends VerifyEmailState {}
final class VerifyEmailLoading extends VerifyEmailState {}
final class VerifyEmailSuccess extends VerifyEmailState {
  final String code ;
  VerifyEmailSuccess({required this.code});
}
final class VerifyEmailFailure extends VerifyEmailState {
  final String errorMessage ;

  VerifyEmailFailure({required this.errorMessage});
}



