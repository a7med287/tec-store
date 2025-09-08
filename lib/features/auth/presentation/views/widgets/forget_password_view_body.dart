import 'package:flutter/material.dart';
import 'package:tec_store/core/utils/app_images.dart';
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
            Image.asset(Assets.logo, height: 180),
            const SizedBox(height: 32),
            CustomTextFormField(
              hintText: S.of(context).email,
              iconData: Icons.email_outlined,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
             CustomButton(text: S.of(context).sendEmail),
            const SizedBox(height: 26),
          ],
        ),
      ),
    );
  }
}

