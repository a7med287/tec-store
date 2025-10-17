import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tec_store/constants.dart';
import 'package:tec_store/core/services/api_services.dart';
import 'package:tec_store/core/services/get_it_service.dart';
import 'package:tec_store/core/services/shared_prefrences_singletone.dart';
import '../../../data/repos/edit_profile_repo_impl.dart';
import '../../cubits/edit_profile_cubit/edit_profile_cubit.dart';
import '../widgets/edit_profile_view_body.dart';

class EditProfileBlocListener extends StatelessWidget {
  const EditProfileBlocListener({super.key});

  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (context) => EditProfileCubit(EditProfileRepoImpl(getIt<ApiServices>())),
      child: BlocListener<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state is EditProfileLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          } else if (state is EditProfileSuccess) {
            Navigator.pop(context); // close loading
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.entity.messageAr)),
            );
          } else if (state is EditProfileFailure) {
            Navigator.pop(context); // close loading
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
            debugPrint("Error: ${state.error}");
          }
        },
        child: EditProfileViewBody(),
      ),
    );
  }
}
