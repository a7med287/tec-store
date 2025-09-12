
import 'package:tec_store/core/services/api_services.dart';
import 'package:tec_store/features/auth/data/models/user_model.dart';
import 'package:tec_store/features/auth/domain/entities/user_entity.dart';
import 'package:tec_store/features/auth/domain/repos/auth_epo.dart';


class AuthRepoImpl extends AuthRepo {
  final ApiServices apiServices;

  AuthRepoImpl({required this.apiServices});
  @override
  Future<UserEntity> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    var response = await apiServices.post(
      "auth/login",
      body: {"email": email, "password": password},
      headers: {
        "Content-Type" : 'application/json',
        "Accept": "application/json",
      }
    );

    var user = UserModel.fromJson(response);

    return user;

  }
}
