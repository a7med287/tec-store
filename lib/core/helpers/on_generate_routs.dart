import 'package:flutter/material.dart';
import 'package:tec_store/features/auth/presentation/views/forget_password_view.dart';
import 'package:tec_store/features/auth/presentation/views/register_view.dart';
import 'package:tec_store/features/auth/presentation/views/verfiy_view.dart';
import 'package:tec_store/features/splash/presetation/views/splash_view.dart';

import '../../features/auth/presentation/views/sign_in_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case SignInView.routName:
      return MaterialPageRoute(builder: (context) => const SignInView());
    case RegisterView.routName:
      return MaterialPageRoute(builder: (context) => const RegisterView());
    case ForgetPasswordView.routName:
      return MaterialPageRoute(
        builder: (context) => const ForgetPasswordView(),
      );
    case VerfiyView.routName:
      return MaterialPageRoute(builder: (context) => const VerfiyView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
