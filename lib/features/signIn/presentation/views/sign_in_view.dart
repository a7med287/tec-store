import 'package:flutter/material.dart';
import 'package:tec_store/features/signIn/presentation/views/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const String routName = "SignInView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SignInViewBody()
    );
  }
}
