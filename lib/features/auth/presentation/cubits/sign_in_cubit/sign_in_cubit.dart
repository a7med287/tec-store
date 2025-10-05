import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tec_store/features/auth/domain/entities/user_entity.dart';
import 'package:tec_store/features/auth/domain/repos/auth_epo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());

  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(SignInLoading());
    try {
      var user = await authRepo.signInWithEmailAndPassword(email, password);
      emit(SignInSuccess(userEntity: user));
    } catch (e) {
      final errorMessage = e.toString();
      if (errorMessage.contains("Invalid email or password") ||
          errorMessage.contains("الوصول غير مصرح به")) {
        emit(
          SignInFailure(
            errorMessage:
                Intl.getCurrentLocale() == "ar"
                    ? "اسم المستخدم أو كلمة المرور غير صحيحة"
                    : "email or password is not correct",
          ),
        );
      } else if (errorMessage.contains("لا يوجد اتصال بالإنترنت")) {
        emit(
          SignInFailure(
            errorMessage:
                Intl.getCurrentLocale() == "ar"
                    ? " لا يوجد اتصال بالإنترنت"
                    : "No Internet connection",
          ),
        );
      } else if (errorMessage.contains("Email not confirmed")) {
        emit(
          SignInFailure(
            errorMessage:
                Intl.getCurrentLocale() == "ar"
                    ? "البريد الإلكتروني غير مؤكد"
                    : "Email not confirmed",
          ),
        );
      } else {
        emit(SignInFailure(errorMessage: "حصل خطأ: $errorMessage"));
      }
    }
  }
}
