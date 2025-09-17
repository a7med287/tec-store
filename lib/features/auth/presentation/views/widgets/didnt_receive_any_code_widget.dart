import 'package:flutter/material.dart';
import 'package:tec_store/generated/l10n.dart';

import '../../../../../core/services/api_services.dart';
import '../../../../../core/services/database_services.dart';
import '../../../../../core/services/get_it_service.dart';
import '../../../../../core/utils/app_theme.dart';
import '../../../data/repos/auth_repo_impl.dart';

class DidntReceiveAnyCodeWidget extends StatelessWidget {
  const DidntReceiveAnyCodeWidget({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).DidntReceiveAnyCode,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xff616A6B),
          ),
        ),
        TextButton(
          onPressed: () async {
            try {
              await AuthRepoImpl(
                getIt.get<DatabaseServices>(),
                apiServices: getIt.get<ApiServices>(),
              ).resendVerificationCode(email, 0);
            } catch (e) {
              print(e.toString());
            }
          },
          child: Text(
            S.of(context).ResendCode,
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
