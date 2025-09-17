import 'package:flutter/material.dart';
import 'package:tec_store/features/splash/presetation/views/splash_view_body.dart';
import '../../../../core/utils/app_theme.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const String routName = "splashView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary,
      body: const SplashViewBody(),
    );
  }
}
