import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tec_store/core/helpers/build_snak_bar.dart';
import 'package:tec_store/features/auth/presentation/views/create_newPassword_view.dart';
import 'package:tec_store/features/auth/presentation/views/widgets/verfiy_view_body.dart';
import 'package:tec_store/features/home/presentation/views/home_view.dart';

import '../../../../../core/enums/verify_flow.dart';
import '../../cubits/verify_email_cubit/verify_email_cubit.dart';

class VerifyEmailViewBodyBlockConsumer extends StatelessWidget {
  const VerifyEmailViewBodyBlockConsumer({super.key, required this.email, required this.flow});
  final VerifyFlow flow;
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyEmailCubit, VerifyEmailState>(
      listener: (context, state) {
        if (state is VerifyEmailSuccess) {
          if (flow == VerifyFlow.register) {
            buildSnackBar(context, "Confirmed Successful");
            Navigator.pushReplacementNamed(context, HomeView.routName);
          } else {
            buildSnackBar(context, "Confirmed Successful, create new password");
            Navigator.pushReplacementNamed(context, CreateNewPasswordView.routName);
          }
        }
        if (state is VerifyEmailFailure) {
          buildSnackBar(context, state.errorMessage, isError: true);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is VerifyEmailLoading ? true : false,
          child: VerifyViewBody(email: email.trim()),
        );
      },
    );
  }
}
