import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tec_store/features/auth/domain/repos/auth_epo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepo) : super(ForgetPasswordInitial());

  final AuthRepo authRepo;

  Future<void> forgetPassword(String email) async {
    emit(ForgetPasswordLoading());
    try {
        await authRepo.forgetPassword(email);
        emit(ForgetPasswordSuccess( email: email ));
    } catch (e) {
      final errorMessage = e.toString();
      if (errorMessage.contains("لا يوجد اتصال بالإنترنت")) {
        emit(
          ForgetPasswordFailure(
            Intl.getCurrentLocale() == "ar"
                ? " لا يوجد اتصال بالإنترنت"
                : "No Internet connection",
          ),
        );
      } else {
        emit(ForgetPasswordFailure("error in forgot cubit $errorMessage"));
        debugPrint("error in forgot cubit  $errorMessage");
      }
    }
  }
}
