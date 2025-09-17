import 'package:bloc/bloc.dart';
import 'package:tec_store/features/auth/domain/repos/auth_epo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepo) : super(ForgetPasswordInitial());

  final AuthRepo authRepo;

  Future<void> forgetPassword(String email) async {
    emit(ForgetPasswordLoading());
    try {
      final success = await authRepo.forgetPassword(email);
      if (success) {
        emit(ForgetPasswordSuccess("OTP sent to your email."));
      } else {
        emit(ForgetPasswordFailure("Failed to send OTP."));
      }
    } catch (e) {
      emit(ForgetPasswordFailure(e.toString().replaceAll("Exception: ", "")));
    }
  }
}
