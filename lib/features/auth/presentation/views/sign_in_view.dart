import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tec_store/core/services/get_it_service.dart';
import 'package:tec_store/features/auth/domain/repos/auth_epo.dart';
import 'package:tec_store/features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:tec_store/features/auth/presentation/views/widgets/sign_in_view_body_block_consumer.dart';
import 'package:tec_store/generated/l10n.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const String routName = "SignInView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S
                .of(context)
                .signIn,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SignInViewBodyBlockConsumer(),
      ),
    );
  }
}

