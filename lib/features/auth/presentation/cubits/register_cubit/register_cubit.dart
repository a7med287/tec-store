import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../domain/repos/auth_epo.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());

  final AuthRepo authRepo;

  Future<void> signUpWithEmailAndPassword(
    String firstName,
    String lastName,
    String email,
    String password,
    String confirmPassword,
  ) async {
    emit(RegisterLoading());
    try {
      await authRepo.signUpWithEmailAndPassword(
        firstName,
        lastName,
        email,
        password,
        confirmPassword,
      );
      emit(RegisterSuccess(email: email));
    } catch (e) {
      final errorMessage = e.toString();
      if (errorMessage.contains("Email is already registered") ||
          errorMessage.contains("تعارض المورد")) {
        emit(
          RegisterFailure(
            errorMessage:
                Intl.getCurrentLocale() == "ar"
                    ? "البريد الإلكتروني مسجل بالفعل"
                    : "Email is already registered",
          ),
        );
      } else if (errorMessage.contains(
        "Password must be at least 6 characters",
      )) {
        emit(
          RegisterFailure(
            errorMessage:
                Intl.getCurrentLocale() == "ar"
                    ? "كلمة المرور يجب أن تكون على الأقل 6 أحرف"
                    : "Password must be at least 6 characters",
          ),
        );
      } else if (errorMessage.contains(
        "Passwords must have at least one lowercase ('a'-'z')",
      )) {
        emit(
          RegisterFailure(
            errorMessage:
                Intl.getCurrentLocale() == "ar"
                    ? "كلمة المرور يجب أن تحتوي على حرف صغير ('a'-'z')"
                    : "Password must have at least one lowercase letter ('a'-'z')",
          ),
        );
      } else if (errorMessage.contains(
        "Passwords must have at least one uppercase ('A'-'Z')",
      )) {
        emit(
          RegisterFailure(
            errorMessage:
                Intl.getCurrentLocale() == "ar"
                    ? "كلمة المرور يجب أن تحتوي على حرف كبير ('A'-'Z')"
                    : "Password must have at least one uppercase letter ('A'-'Z')",
          ),
        );
      } else if (errorMessage.contains("لا يوجد اتصال بالإنترنت")) {
        emit(
          RegisterFailure(
            errorMessage:
                Intl.getCurrentLocale() == "ar"
                    ? " لا يوجد اتصال بالإنترنت"
                    : "No Internet connection",
          ),
        );
      } else {
        emit(
          RegisterFailure(
            errorMessage:
                Intl.getCurrentLocale() == "ar" ? errorMessage : errorMessage,
          ),
        );
        debugPrint(errorMessage);
      }
    }
  }
}
