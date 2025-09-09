import 'package:tec_store/core/services/api_services.dart';
import 'package:tec_store/features/auth/data/models/user_model.dart';
import 'package:tec_store/features/auth/domain/entities/user_entity.dart';
import 'package:tec_store/features/auth/domain/repos/auth_epo.dart';

import '../../../../core/services/database_services.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiServices apiServices;
  final DatabaseService databaseService;

  AuthRepoImpl({required this.apiServices, required this.databaseService});
  @override
  Future<UserEntity> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    var response = await apiServices.post(
      "login",
      body: {"username": email, "password": password},
      headers: {
        "Content-Type" : 'application/json'
      }
    );

    var user = UserModel.fromJson(response);

    await databaseService.insertUser({
      'id': user.id,
      'name': user.name,
      'email': user.email,
      'token': user.token,
    });

    return user;
  }
}
