import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../domain/entities/user_entity.dart';
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
      var user = await authRepo.signUpWithEmailAndPassword(
        firstName,
        lastName,
        email,
        password,
        confirmPassword,
      );
      emit(RegisterSuccess(userEntity: user));
    } catch (e) {
      final errorMessage = e.toString();
      if (errorMessage.contains("Email is already registered") ||
          errorMessage.contains("تعارض المورد")) {
        emit(
          RegisterFailure(
            errorMessage: Intl.getCurrentLocale() == "ar"
                ? "البريد الإلكتروني مسجل بالفعل"
                : "Email is already registered",
          ),
        );
      } else if (errorMessage.contains(
        "Passwords must have at least one lowercase ('a'-'z')",
      )) {
        emit(
          RegisterFailure(
            errorMessage: Intl.getCurrentLocale() == "ar"
                ? "كلمة المرور يجب أن تحتوي على حرف صغير ('a'-'z')"
                : "Password must have at least one lowercase letter ('a'-'z')",
          ),
        );
      } else if (errorMessage.contains(
        "Passwords must have at least one uppercase ('A'-'Z')",
      )) {
        emit(
          RegisterFailure(
            errorMessage: Intl.getCurrentLocale() == "ar"
                ? "كلمة المرور يجب أن تحتوي على حرف كبير ('A'-'Z')"
                : "Password must have at least one uppercase letter ('A'-'Z')",
          ),
        );
      } else {
        emit(
          RegisterFailure(
            errorMessage: Intl.getCurrentLocale() == "ar"
                ? "حصل خطأ: $errorMessage"
                : "An error occurred: $errorMessage",
          ),
        );
        debugPrint(errorMessage);
      }
    }
  }
}
