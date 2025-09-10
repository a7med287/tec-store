import 'package:flutter/material.dart';
import 'package:tec_store/features/auth/presentation/views/widgets/register_view_body.dart';
import 'package:tec_store/generated/l10n.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routName = "RegisterView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).signUp,
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: RegisterViewBody(),
    );
  }
}
