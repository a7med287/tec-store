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
      }else if (errorMessage.contains("Password must be at least 6")) {
        emit(
          ResetPasswordFailure(
            Intl.getCurrentLocale() == "ar"
                ? "كلمة المرور يجب أن تكون على الأقل 6 أحرف"
                : "Password must be at least 6 characters",
          ),
        );
      }else if (errorMessage.contains("Password and confirmation password do not match")) {
        emit(
          ResetPasswordFailure(
            Intl.getCurrentLocale() == "ar"
                ? "كلمة المرور غير متطابقة"
                : "Passwords do not match",
          ),
        );
      }else if (errorMessage.contains(
        "Passwords must have at least one lowercase ('a'-'z')",
      )) {
        emit(
          ResetPasswordFailure(
             Intl.getCurrentLocale() == "ar"
                ? "كلمة المرور يجب أن تحتوي على حرف صغير ('a'-'z')"
                : "Password must have at least one lowercase letter ('a'-'z')",
          ),
        );
      } else if (errorMessage.contains(
        "Passwords must have at least one uppercase ('A'-'Z')",
      )) {
        emit(
          ResetPasswordFailure(
           Intl.getCurrentLocale() == "ar"
                ? "كلمة المرور يجب أن تحتوي على حرف كبير ('A'-'Z')"
                : "Password must have at least one uppercase letter ('A'-'Z')",
          ),
        );
      } else {
        emit(ResetPasswordFailure("error in forgot cubit $errorMessage"));
        debugPrint("error in forgot cubit  $errorMessage");
      }
    }
  }
}
