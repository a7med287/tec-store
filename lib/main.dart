import 'package:flutter/material.dart';
import 'package:tec_store/core/helpers/on_generate_routs.dart';
import 'core/utils/app_colors.dart';
import 'features/splash/presetation/views/splash_view.dart';

void main() {
  runApp(const TecZone());
}

class TecZone extends StatelessWidget {
  const TecZone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Cairo",
        primaryColor: AppColors.primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routName,
    );
  }
}

