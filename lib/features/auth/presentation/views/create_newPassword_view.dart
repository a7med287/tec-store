import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tec_store/core/services/get_it_service.dart';
import 'package:tec_store/features/auth/domain/repos/auth_epo.dart';
import 'package:tec_store/features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:tec_store/features/auth/presentation/views/widgets/create_newpassword_body.dart';
import 'package:tec_store/features/auth/presentation/views/widgets/sign_in_view_body_block_consumer.dart';
import 'package:tec_store/generated/l10n.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key});

  static const String routName = "CreateNewPasswordView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).CreateNewPassword,
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: CreateNewPasswordBody(),
    );
  }
}
