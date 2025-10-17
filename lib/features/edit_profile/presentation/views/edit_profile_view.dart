import 'package:flutter/material.dart';
import 'package:tec_store/features/edit_profile/presentation/views/widgets/edit_peofile_view_body_block_listener.dart';
import 'package:tec_store/features/edit_profile/presentation/views/widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: EditProfileBlocListener()));
  }
}
