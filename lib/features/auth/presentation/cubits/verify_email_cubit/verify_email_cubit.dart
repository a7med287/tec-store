import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tec_store/features/auth/domain/repos/auth_epo.dart';

part 'verify_email_state.dart';

// ...
class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit(this.authRepo) : super(VerifyEmailInitial());

  final AuthRepo authRepo;

  Future<void> confirmEmail(String email,String code) async {
    emit(VerifyEmailLoading());
    try {
      await authRepo.confirmEmail(email , code);
      emit(VerifyEmailSuccess(code: code));
    } catch (e) {
      final errorMessage = e.toString();
      debugPrint(errorMessage);
      if (errorMessage.contains("لا يوجد اتصال بالإنترنت")) {
        emit(
          VerifyEmailFailure(
            errorMessage:
                Intl.getCurrentLocale() == "ar"
                    ? " لا يوجد اتصال بالإنترنت"
                    : "No Internet connection",
          ),
        );
      } else if (errorMessage.contains("Invalid verification code")) {
        emit(
          VerifyEmailFailure(
            errorMessage:
                Intl.getCurrentLocale() == "ar"
                    ? "رمز التحقق غير صالح"
                    : "Invalid verification code",
          ),
        );
      } else {
        emit(VerifyEmailFailure(errorMessage: errorMessage));
      }
    }
  }
}
