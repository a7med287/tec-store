import 'package:flutter/material.dart';
import 'package:tec_store/generated/l10n.dart';

import '../../../../../core/utils/app_colors.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        S.of(context).forgotPassword,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.lightPrimaryColor,
        ),
      ),
    );
  }
}
