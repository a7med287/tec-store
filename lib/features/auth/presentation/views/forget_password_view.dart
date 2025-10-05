import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tec_store/core/services/get_it_service.dart';
import 'package:tec_store/features/auth/domain/repos/auth_epo.dart';
import 'package:tec_store/features/auth/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:tec_store/features/auth/presentation/views/widgets/forget_password_view_body_block_consumer.dart';
import 'package:tec_store/generated/l10n.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  static const String routName = "ForgetPasswordView";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).forgotPassword,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: const ForgetPasswordViewBodyBlockConsumer(),
      ),
    );
  }
}
