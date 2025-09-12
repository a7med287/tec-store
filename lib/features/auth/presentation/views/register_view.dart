import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tec_store/core/services/get_it_service.dart';
import 'package:tec_store/features/auth/domain/repos/auth_epo.dart';
import 'package:tec_store/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:tec_store/features/auth/presentation/views/widgets/register_view_body.dart';
import 'package:tec_store/features/auth/presentation/views/widgets/resgister_view_body_block_consumer.dart';
import 'package:tec_store/generated/l10n.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  static const String routName = "RegisterView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S
                .of(context)
                .signUp,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: RegisterViewBodyBlockConsumer(),
      ),
    );
  }
}

