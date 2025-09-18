import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tec_store/core/helpers/build_snak_bar.dart';
import 'package:tec_store/features/auth/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:tec_store/features/auth/presentation/views/verfiy_view.dart';
import 'package:tec_store/features/auth/presentation/views/widgets/forget_password_view_body.dart';

import '../../../../../core/enums/verify_flow.dart';

class ForgetPasswordViewBodyBlockConsumer extends StatelessWidget {
  const ForgetPasswordViewBodyBlockConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          buildSnackBar(context, "Email Sent Success");
          Navigator.pushReplacementNamed(
            context,
            VerifyView.routName,
            arguments:  {
              'email': state.email,
              'flow': VerifyFlow.forgotPassword,
            },
          );
        }
        if (state is ForgetPasswordFailure) {
          buildSnackBar(context, state.errorMessage, isError: true);
          debugPrint(state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ForgetPasswordLoading ? true : false,
          child: ForgetPasswordViewBody(),
        );
      },
    );
  }
}
