import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tec_store/core/utils/app_images1.dart';
import 'package:tec_store/core/widgets/password_text_filed.dart';
import 'package:tec_store/features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:tec_store/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:tec_store/features/auth/presentation/views/widgets/social_button.dart';
import 'package:tec_store/generated/l10n.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import 'dont_have_an_account_widget.dart';
import 'forgot_password_widget.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<RegisterViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String userName, email, password, confirmPassword;
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
              const SizedBox(height: 14),
              Image.asset(Assets.assetsImagesLogo, height: 120),
              const SizedBox(height: 28),
              CustomTextFormField(
                onSaved: (value) {
                  userName = value!;
                },
                hintText: S.of(context).userName,
                iconData: Icons.person,
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              PasswordTextFormField(
                onSaved: (value) {
                  confirmPassword = value!;
                },
                hintText: S.of(context).confirmPassword,
                iconData: Icons.lock,
                textInputType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 35),
              CustomButton(
                text: S.of(context).signUp,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    // context.read<SignInCubit>().signInWithEmailAndPassword(
                    //   email,
                    //   password,
                    // );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
