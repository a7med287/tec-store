import 'package:flutter/material.dart';
import 'package:tec_store/features/splash/presetation/views/splash_view.dart';

import '../../features/auth/presentation/views/sign_in_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings){

  switch(settings.name){
    case SplashView.routName:
      return MaterialPageRoute(builder: (context) => const SplashView(),);
    case SignInView.routName:
      return MaterialPageRoute(builder: (context) => const SignInView(),);
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold(),);
  }

}