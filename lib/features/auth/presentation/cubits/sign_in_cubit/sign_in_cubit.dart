import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tec_store/features/auth/domain/entities/user_entity.dart';
import 'package:tec_store/features/auth/domain/repos/auth_epo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());

  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(SignInLoading());
    try {
     var user =  await authRepo.signInWithEmailAndPassword(email, password);
      emit(SignInSuccess(userEntity: user));
    } catch (e) {
      if (e.toString().contains("Invalid credentials")) {
        emit(SignInFailure(errorMessage: "اسم المستخدم أو كلمة المرور غير صحيحة"));
      }else{
        emit(
          SignInFailure(errorMessage: "error in sign in cubit: ${e.toString()}"),
        );
      }

    }
  }
}
