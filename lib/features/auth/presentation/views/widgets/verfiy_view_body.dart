import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tec_store/core/utils/app_images1.dart';
import 'package:tec_store/features/auth/presentation/cubits/verify_email_cubit/verify_email_cubit.dart';
import 'package:tec_store/features/auth/presentation/views/widgets/didnt_receive_any_code_widget.dart';
import 'package:tec_store/features/auth/presentation/views/widgets/pin_digits_widget.dart';
import 'package:tec_store/generated/l10n.dart';
import '../../../../../core/widgets/custom_button.dart';

class VerifyViewBody extends StatefulWidget {
  const VerifyViewBody({super.key, required this.email});

  final String email;

  @override
  State<VerifyViewBody> createState() => _VerifyViewBodyState();
}

class _VerifyViewBodyState extends State<VerifyViewBody> {
  late String code;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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
                S.of(context).VerifyYourEmailtoContinue,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(S.of(context).EnterThe6Digit),
              const SizedBox(height: 32),
              PinDigitsWidget(
                valueChangedCode: (value) {
                  code = value;
                },
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: S.of(context).Continue,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<VerifyEmailCubit>().confirmEmail(
                      widget.email.trim(),
                      code,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                  debugPrint(
                    "email:${widget.email}, code:$code",
                  );
                },
              ),
              const SizedBox(height: 26),
              DidntReceiveAnyCodeWidget(email: widget.email,),
            ],
          ),
        ),
      ),
    );
  }
}
