import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tec_store/core/utils/app_images1.dart';
import 'package:tec_store/features/auth/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:tec_store/generated/l10n.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
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
                onSaved: (value){
                  email=value!;
                } ,
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: S.of(context).sendEmail,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<ForgetPasswordCubit>().forgetPassword(
                        email
                      );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                },
              ),
              const SizedBox(height: 26),
            ],
          ),
        ),
      ),
    );
  }
}
