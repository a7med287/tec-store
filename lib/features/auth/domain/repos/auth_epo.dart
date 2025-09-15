import '../entities/user_entity.dart';

abstract class AuthRepo {
  Future<UserEntity> signInWithEmailAndPassword(String email, String password);
  Future<UserEntity> signUpWithEmailAndPassword(
    String firstName,
    String lastName,
    String email,
    String password,
    String confirmPassword,
  );
  Future<bool> forgetPassword(String email);

  Future<void> confirmEmail(String emil, String code);
}
