import 'package:tec_store/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String? token;

  UserModel({
    required super.id,
    required super.name,
    required super.email,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"].toString(),
      name: "${json["firstName"] ?? ""} ${json["lastName"] ?? ""}".trim(),
      email: json["email"] ?? "",
      token: json["token"],
    );
  }
}
