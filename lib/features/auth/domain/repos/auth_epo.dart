import '../entities/user_entity.dart';

abstract class AuthRepo {
  Future<UserEntity> signInWithEmailAndPassword(String email, String password);
}
