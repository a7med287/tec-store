import 'package:flutter/material.dart';
import 'package:tec_store/features/auth/presentation/views/widgets/verify_email_body_bloc_consumer.dart';
import 'package:tec_store/generated/l10n.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({super.key});

  static const String routName = "VerfiyView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).verifyYourEmail,
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: VerifyEmailViewBodyBlockConsumer(
        email: ModalRoute.of(context)!.settings.arguments.toString(),
      ),
    );
  }
}
