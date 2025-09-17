import 'package:flutter/material.dart';
import 'package:tec_store/generated/l10n.dart';

import '../../../../../core/utils/app_theme.dart';

class DidntReceiveAnyCodeWidget extends StatelessWidget {
  const DidntReceiveAnyCodeWidget({super.key});

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
        GestureDetector(
          onTap: () {},
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
