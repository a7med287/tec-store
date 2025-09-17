import 'package:flutter/material.dart';
import 'package:tec_store/core/utils/app_colors.dart';

import '../../../../generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routName = "HomeView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).welcome,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              "Home",
              style: TextStyle(
                color: AppColors.lightPrimaryColor,
                fontSize: 40,
                fontWeight: FontWeight.bold,
               // fontFamily: "fontLogo",
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
