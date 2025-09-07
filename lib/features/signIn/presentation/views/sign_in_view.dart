import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const String routName = "SignInView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Login View"),
      ),
    );
  }
}
