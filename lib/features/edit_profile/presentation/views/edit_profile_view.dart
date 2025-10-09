import 'package:flutter/material.dart';
import 'package:tec_store/core/widgets/custom_button.dart';
import 'package:tec_store/core/widgets/custom_text_form_field.dart';

import '../../../../core/utils/app_theme.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: EditProfileViewBody()));
  }
}

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20).copyWith(top: 32),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(title: 'Edit Your Profile'),
            SizedBox(height: 50),
            Text(
              "Full Name",
              style: AppTheme.heading2.copyWith(
                color: AppTheme.textPrimary,
                fontSize: 18,
              ),
            ),
            CustomTextFormField(
              hintText: "Edit your name",
              iconData: Icons.person,
              textInputType: TextInputType.name,
            ),
            SizedBox(height: 16),
            Text(
              "User Name",
              style: AppTheme.heading2.copyWith(
                color: AppTheme.textPrimary,
                fontSize: 18,
              ),
            ),
            CustomTextFormField(
              hintText: "Edit your Username",
              iconData: Icons.person,
              textInputType: TextInputType.name,
            ),
            SizedBox(height: 16),
            Text(
              "Email",
              style: AppTheme.heading2.copyWith(
                color: AppTheme.textPrimary,
                fontSize: 18,
              ),
            ),
            CustomTextFormField(
              hintText: "Edit your Email",
              iconData: Icons.email_rounded,
              textInputType: TextInputType.name,
            ),
            SizedBox(height: 16),
            CustomButton(text: "Save Change"),
          ],
        ),
      ),
    );
  }
}
