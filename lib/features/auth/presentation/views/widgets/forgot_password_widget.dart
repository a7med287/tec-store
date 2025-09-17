import 'package:flutter/material.dart';
import 'package:tec_store/features/auth/presentation/views/forget_password_view.dart';
import 'package:tec_store/generated/l10n.dart';
import '../../../../../core/utils/app_theme.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, ForgetPasswordView.routName);
      },
      child: Text(
        S.of(context).forgotPassword,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: AppTheme.secondary,
        ),
      ),
    );
  }
}
