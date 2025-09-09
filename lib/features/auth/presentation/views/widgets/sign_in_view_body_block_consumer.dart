import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tec_store/core/helpers/build_snak_bar.dart';
import 'package:tec_store/features/auth/presentation/views/widgets/sign_in_view_body.dart';

import '../../cubits/sign_in_cubit/sign_in_cubit.dart';
class SignInViewBodyBlockConsumer extends StatelessWidget {
  const SignInViewBodyBlockConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if(state is SignInSuccess){
          buildSnackBar(context, "Logged in Success");
        }
        if(state is SignInFailure){
          buildSnackBar(context, state.errorMessage , isError: true);
          debugPrint(state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is SignInLoading ? true : false ,
            child: SignInViewBody());
      },
    );
  }
}
