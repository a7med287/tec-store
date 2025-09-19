import 'package:flutter/material.dart';
import 'package:tec_store/features/auth/presentation/views/widgets/create_newPassword_bloc_consumer.dart';
import 'package:tec_store/generated/l10n.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key, required this.email, required this.code});
  final String email;
  final String code;
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
      body: CreateNewPasswordBlocConsumer(email: email, code: code),
    );
  }
}
