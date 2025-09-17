import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tec_store/core/utils/app_images1.dart';
import 'package:tec_store/core/widgets/password_text_filed.dart';
import 'package:tec_store/features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:tec_store/generated/l10n.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class CreateNewPasswordBody extends StatefulWidget {
  const CreateNewPasswordBody({super.key});

  @override
  State<CreateNewPasswordBody> createState() => CreateNewPasswordBodyState();
}

class CreateNewPasswordBodyState extends State<CreateNewPasswordBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String password, confirmPassword;
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
              PasswordTextFormField(
                onSaved: (value) {
                  password = value!;
                },
                hintText: S.of(context).newPassword,
                iconData: Icons.lock,
                textInputType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    S.of(context).passwordRule,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              PasswordTextFormField(
                onSaved: (value) {
                  confirmPassword = value!;
                },
                hintText: S.of(context).confirmNewPassword,
                iconData: Icons.lock,
                textInputType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 35),

              // Not Complete
              CustomButton(
                text: S.of(context).CreateNewPassword,
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
