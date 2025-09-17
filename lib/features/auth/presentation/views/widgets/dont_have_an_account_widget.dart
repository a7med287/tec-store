import 'package:flutter/material.dart';
import 'package:tec_store/features/auth/presentation/views/register_view.dart';
import 'package:tec_store/generated/l10n.dart';
import '../../../../../core/utils/app_theme.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).DontHaveAnAccount,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xff616A6B),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RegisterView.routName);
          },
          child: Text(
            S.of(context).signUp,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppTheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
