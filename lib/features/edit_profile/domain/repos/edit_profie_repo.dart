import '../entities/edit_profile_entity.dart';

abstract class EditProfileRepo {
  Future<EditProfileEntity> editProfile({
    required String token,
    required String userName,
    required String fullName,
    required String email,
  });
}
