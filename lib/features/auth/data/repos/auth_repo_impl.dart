import 'package:tec_store/core/services/api_services.dart';
import 'package:tec_store/core/services/database_services.dart';
import 'package:tec_store/features/auth/data/models/user_model.dart';
import 'package:tec_store/features/auth/domain/entities/user_entity.dart';
import 'package:tec_store/features/auth/domain/repos/auth_epo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiServices apiServices;
  final DatabaseServices databaseServices;

  AuthRepoImpl(this.databaseServices, {required this.apiServices});
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

    final token = response["data"]["token"];
    await databaseServices.saveToken(token);

    var user = UserModel.fromJson(response);

    return user;
  }

  @override
  Future<bool> signUpWithEmailAndPassword(
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
    if (response["isSuccess"] == true && response["statusCode"] == 200) {
      return true;
    } else {
      final errors = response["errors"];
      if (errors is List) {
        throw Exception(errors.join("\n"));
      }
      throw Exception(response["message"]);
    }
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

    if (response["isSuccess"] == true && response["statusCode"] == 200) {
      return true;
    } else {
      final errors = response["errors"];
      if (errors is List) {
        throw Exception(errors.join("\n"));
      }
      throw Exception(response["message"]);
    }
  }

  @override
  Future<bool> confirmEmail(String email, String code) async {
    var response = await apiServices.post(
      "auth/confirm-email",
      body: {"email": email, "code": code},
      headers: {
        "Content-Type": 'application/json',
        "Accept": "application/json",
      },
    );

    if (response["statusCode"] != null && response["statusCode"] != 200) {
      throw Exception(response["message"] ?? "Login failed");
    }
    if (response["statusCode"] == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> resendVerificationCode(
    String email,
    int verificationType,
  ) async {
    var response = await apiServices.post(
      "auth/resend-verification-code",
      body: {"email": email, "verificationType": verificationType},
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
      throw Exception(
        response["message"] ?? "Failed to resend verification code",
      );
    }
  }
  
  @override
  Future<void> resetPassword(
    String email,
    String code,
    String newPassword,
    String confirmPassword
    ) async {
      var response = await apiServices.post(
      "auth/reset-password",
      body: {
        "email": email, 
        "code": code, 
        "newPassword": newPassword, 
        "confirmPassword": confirmPassword
      },
      headers: {
        "Content-Type": 'application/json',
        "Accept": "application/json",
      },
    );

    if (response["statusCode"] != null && response["statusCode"] != 200) {
      throw Exception(response["message"] ?? "Reset password failed");
    }
  }
}
