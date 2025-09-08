import 'package:flutter/material.dart';
import 'package:tec_store/features/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:tec_store/generated/l10n.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const String routName = "SignInView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).signIn,style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: const SignInViewBody()
    );
  }
}
