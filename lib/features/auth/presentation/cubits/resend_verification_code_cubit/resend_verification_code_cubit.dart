import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repos/auth_epo.dart';

part 'resend_verification_code_state.dart'; 

class ResendVerificationCubit extends Cubit<ResendVerificationState> {
  final AuthRepo authRepo;

  ResendVerificationCubit(this.authRepo) : super(ResendVerificationInitial());

  Future<void> resend(String email, int verificationType) async {
    emit(ResendVerificationLoading());
    try {
      final result = await authRepo.resendVerificationCode(email, verificationType);
      if (result) {
        emit(const ResendVerificationSuccess("Verification code sent."));
      } else {
        emit(const ResendVerificationFailure("Unable to resend verification code."));
      }
    } catch (e) {
      emit(ResendVerificationFailure(e.toString().replaceAll("Exception: ", "")));
    }
  }
}
