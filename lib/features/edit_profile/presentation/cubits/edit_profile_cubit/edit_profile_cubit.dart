import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/edit_profile_entity.dart';
import '../../../domain/repos/edit_profie_repo.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileRepo repo;

  EditProfileCubit(this.repo) : super(EditProfileInitial());

  Future<void> editProfile({
    required String token,
    required String userName,
    required String fullName,
    required String email,
  }) async {
    emit(EditProfileLoading());
    try {
      final result = await repo.editProfile(
        token: token,
        userName: userName,
        fullName: fullName,
        email: email,
      );
      emit(EditProfileSuccess(result));
    } catch (e) {
      emit(EditProfileFailure(e.toString()));
    }
  }
}
