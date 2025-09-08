import 'package:flutter/material.dart';
import 'package:tec_store/features/auth/presentation/views/widgets/verfiy_view_body.dart';
import 'package:tec_store/generated/l10n.dart';

class VerfiyView extends StatelessWidget {
  const VerfiyView({super.key});

  static const String routName = "VerfiyView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).verifyYourEmail,style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: const VerfiyViewBody()
    );
  }
}