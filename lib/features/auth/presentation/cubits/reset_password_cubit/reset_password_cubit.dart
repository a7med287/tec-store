import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tec_store/features/auth/domain/repos/auth_epo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.authRepo) : super(ResetPasswordInitial());

  final AuthRepo authRepo;

  Future<void> resetPassword(
    String email,
    String code,
    String newPassword,
    String confirmPassword,
  ) async {
    emit(ResetPasswordLoading());
    try {
      await authRepo.resetPassword(email, code, newPassword, confirmPassword);
      emit(ResetPasswordSuccess());
    } catch (e) {
      final errorMessage = e.toString();
      if (errorMessage.contains("لا يوجد اتصال بالإنترنت")) {
        emit(
          ResetPasswordFailure(
            Intl.getCurrentLocale() == "ar"
                ? " لا يوجد اتصال بالإنترنت"
                : "No Internet connection",
          ),
        );
      } else {
        emit(ResetPasswordFailure("error in forgot cubit $errorMessage"));
        debugPrint("error in forgot cubit  $errorMessage");
      }
    }
  }
}
