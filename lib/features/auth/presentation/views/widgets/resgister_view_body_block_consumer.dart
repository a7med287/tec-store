import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tec_store/core/helpers/build_snak_bar.dart';
import 'package:tec_store/features/auth/presentation/views/widgets/register_view_body.dart';

import '../../cubits/register_cubit/register_cubit.dart';

class RegisterViewBodyBlockConsumer extends StatelessWidget {
  const RegisterViewBodyBlockConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          buildSnackBar(context, "Registered Successful, login");
          Navigator.pop(context);
        }
        if (state is RegisterFailure) {
          buildSnackBar(context," ${state.errorMessage}",isError: true);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is RegisterLoading ? true : false,
          child: RegisterViewBody(),
        );
      },
    );
  }
}
