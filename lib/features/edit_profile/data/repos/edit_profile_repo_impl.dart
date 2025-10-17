import '../../../../core/services/api_services.dart';
import '../../domain/entities/edit_profile_entity.dart';
import '../../domain/repos/edit_profie_repo.dart';
import '../models/edit_profile_model.dart';

class EditProfileRepoImpl implements EditProfileRepo {
  final ApiServices apiServices;

  EditProfileRepoImpl(this.apiServices);

  @override
  Future<EditProfileEntity> editProfile({
    required String token,
    required String userName,
    required String fullName,
    required String email,
  }) async {
    final response = await apiServices.put(
      "User/profile",
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: {"userName": userName, "fullName": fullName, "email": email},
    );

    if (response['isSuccess'] == true) {
      final model = EditProfileModel.fromJson(response);
      return EditProfileEntity(
        isSuccess: model.isSuccess,
        message: model.message,
        messageAr: model.messageAr,
      );
    } else {
      throw Exception(response['message'] ?? 'Failed to update profile');
    }
  }
}
