import 'package:flutter/material.dart';
import 'package:tec_store/core/utils/app_images.dart';
import 'package:tec_store/features/auth/presentation/views/verfiy_view.dart';
import 'package:tec_store/features/auth/presentation/views/widgets/didnt_receive_any_code_widget.dart';
import 'package:tec_store/features/auth/presentation/views/widgets/pin_digits_widget.dart';
import 'package:tec_store/generated/l10n.dart';
import '../../../../../core/widgets/custom_button.dart';

class VerfiyViewBody extends StatelessWidget {
  const VerfiyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 25),
            Image.asset(Assets.logo, height: 180),
            SizedBox(height: 20),
            Text(
              S.of(context).VerifyYourEmailtoContinue,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(S.of(context).EnterThe6Digit),
            const SizedBox(height: 32),
            PinDigitsWidget(),
            const SizedBox(height: 16),
            CustomButton(
              text: S.of(context).Continue,
              onTap: () {
                Navigator.pushNamed(context, VerfiyView.routName);
              },
            ),
            const SizedBox(height: 26),
            DidntReceiveAnyCodeWidget(),
          ],
        ),
      ),
    );
  }
}
