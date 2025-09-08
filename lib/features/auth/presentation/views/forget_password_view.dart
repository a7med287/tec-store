import 'package:flutter/material.dart';
import 'package:tec_store/features/auth/presentation/views/widgets/forget_password_view_body.dart';
import 'package:tec_store/generated/l10n.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  static const String routName = "ForgetPasswordView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).forgotPassword,style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: const ForgetPasswordViewBody()
    );
  }
}