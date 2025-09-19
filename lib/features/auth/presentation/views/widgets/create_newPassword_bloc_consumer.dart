import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tec_store/core/helpers/build_snak_bar.dart';
import 'package:tec_store/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:tec_store/features/auth/presentation/views/widgets/create_newpassword_body.dart';
import 'package:tec_store/generated/l10n.dart';

class CreateNewPasswordBlocConsumer extends StatelessWidget {
  const CreateNewPasswordBlocConsumer({
    super.key, required this.email, required this.code,
  });
  final String email;
  final String code ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is ResetPasswordSuccess) {
          buildSnackBar(context, S.of(context).passwordResetSuccessfully);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ResetPasswordLoading? true : false,
          child: CreateNewPasswordBody(email: email, code: code)
          );
      },
    );
  }
}
