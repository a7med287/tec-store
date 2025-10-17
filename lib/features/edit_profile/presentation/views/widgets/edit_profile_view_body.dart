import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants.dart';
import '../../../../../core/services/shared_prefrences_singletone.dart';
import '../../../../../core/utils/app_theme.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../cubits/edit_profile_cubit/edit_profile_cubit.dart';

class EditProfileViewBody extends StatefulWidget {


  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String token = Prefs.getString(tokenKey);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20).copyWith(top: 32),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(title: 'Edit Your Profile'),
              const SizedBox(height: 50),
              _buildLabel("Full Name"),
              CustomTextFormField(
                controller: fullNameController,
                hintText: "Edit your name",
                iconData: Icons.person,
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              _buildLabel("User Name"),
              CustomTextFormField(
                controller: userNameController,
                hintText: "Edit your Username",
                iconData: Icons.person_outline,
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              _buildLabel("Email"),
              CustomTextFormField(
                controller: emailController,
                hintText: "Edit your Email",
                iconData: Icons.email_rounded,
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 30),
              BlocBuilder<EditProfileCubit, EditProfileState>(
                builder: (context, state) {
                  return CustomButton(
                    text: "Save Change",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context.read<EditProfileCubit>().editProfile(
                          token: token,
                          userName: userNameController.text.trim(),
                          fullName: fullNameController.text.trim(),
                          email: emailController.text.trim(),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: AppTheme.heading2.copyWith(
        color: AppTheme.textPrimary,
        fontSize: 18,
      ),
    );
  }
}
