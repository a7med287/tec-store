import 'package:flutter/material.dart';
import 'package:tec_store/core/utils/app_images.dart';
import 'custom_text_form_field.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children:  [
              Image.asset(Assets.logo, height: 200),
              const SizedBox(height: 32),
              const CustomTextFormField(
                hintText: 'Email',
                iconData: Icons.email_outlined,
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              const CustomTextFormField(
                isPassword: true,
                hintText: 'Password',
                iconData: Icons.lock,
                textInputType: TextInputType.emailAddress,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
