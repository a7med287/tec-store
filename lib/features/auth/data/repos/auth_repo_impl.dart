
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
        "Content-Type": 'application/json',
        "Accept": "application/json",
      },
    );



    if (response["statusCode"] != null && response["statusCode"] != 200) {
      throw Exception(response["message"] ?? "Login failed");
    }

    var user = UserModel.fromJson(response);

    return user;
  }

  @override
  Future<UserEntity> signUpWithEmailAndPassword(
    String firstName,
    String lastName,
    String email,
    String password,
    String confirmPassword,
  ) async {
    var response = await apiServices.post(
      "auth/register",
      body: {
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "fullName": "$firstName $lastName",
        "userName": email.split('@')[0],
      },
      headers: {
        "Content-Type": 'application/json',
        "Accept": "application/json",
      },
    );

    if (response["success"] == false) {
      final errors = response["errors"];
      if (errors is List) {

        final errorMessage = errors.join("\n");
        throw Exception(errorMessage);
      }
      throw Exception(response["message"]);
    }
    var user = UserModel.fromJson(response);
    return user;
  }
  
  @override
  Future<bool> forgetPassword(String email) async {
    var response = await apiServices.post(
      "auth/forgot-password",
      body: {"email": email},
      headers: {
        "Content-Type": 'application/json',
        "Accept": "application/json",
      },
    );

    if (response["success"] == true) {
      return true;
    } else {
      final errors = response["errors"];
      if (errors is List) {
        final errorMessage = errors.join("\n");
        throw Exception(errorMessage);
      }
      throw Exception(response["message"]);
    }
  }
}