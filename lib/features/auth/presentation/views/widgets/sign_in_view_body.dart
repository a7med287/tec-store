import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tec_store/core/utils/app_images.dart';
import 'package:tec_store/core/widgets/password_text_filed.dart';
import 'package:tec_store/features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:tec_store/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:tec_store/features/auth/presentation/views/widgets/social_button.dart';
import 'package:tec_store/generated/l10n.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import 'dont_have_an_account_widget.dart';
import 'forgot_password_widget.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String email, password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 25),
              Image.asset(Assets.logo, height: 180),
              const SizedBox(height: 32),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: S.of(context).email,
                iconData: Icons.email_outlined,
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              PasswordTextFormField(
                onSaved: (value) {
                  password = value!;
                },
                hintText: S.of(context).password,
                iconData: Icons.lock,
                textInputType: TextInputType.visiblePassword,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [ForgotPasswordWidget()],
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: S.of(context).signIn,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                     context.read<SignInCubit>().signInWithEmailAndPassword(
                      email,
                      password,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
              const SizedBox(height: 26),
              const DontHaveAnAccountWidget(),
              const SizedBox(height: 26),
              const OrDivider(),
              const SizedBox(height: 26),
              const SocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
