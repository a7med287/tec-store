import 'package:flutter/material.dart';
import '../../../../core/utils/app_theme.dart';
import '../../../../generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routName = "HomeView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).welcome,
              style: TextStyle(
                color: AppTheme.primary,
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              "Home",
              style: TextStyle(
                color: AppTheme.secondary,
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
