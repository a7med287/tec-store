import 'package:flutter/material.dart';
import 'package:tec_store/core/utils/app_images1.dart';
import 'package:tec_store/features/auth/presentation/views/verfiy_view.dart';
import 'package:tec_store/generated/l10n.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 25),
            Image.asset(Assets.assetsImagesLogo, height: 180),
            SizedBox(height: 20),
            Text(
              S.of(context).forgotPassword,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              S.of(context).PleaseEnterYourEmail,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            CustomTextFormField(
              hintText: S.of(context).email,
              iconData: Icons.email_outlined,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: S.of(context).sendEmail,
              onTap: () {
                Navigator.pushNamed(context, VerfiyView.routName);
              },
            ),
            const SizedBox(height: 26),
          ],
        ),
      ),
    );
  }
}
