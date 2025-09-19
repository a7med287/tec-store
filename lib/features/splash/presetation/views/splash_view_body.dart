import 'package:flutter/material.dart';
import 'package:tec_store/core/utils/app_images1.dart';
import 'package:tec_store/features/home/presentation/views/home_view.dart';
import 'package:tec_store/generated/l10n.dart';

import '../../../../constants.dart';
import '../../../../core/services/shared_prefrences_singletone.dart';
import '../../../auth/presentation/views/sign_in_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  bool isLoggedIn = false;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      isLoggedIn = Prefs.getBool(kIsLoggedIn);
      isLoggedIn
          ? Navigator.pushReplacementNamed(context, HomeView.routName)
          : Navigator.pushReplacementNamed(context, SignInView.routName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.assetsImagesWhiteLogo, height: 180),
          const SizedBox(height: 40),
          Text(
            S.of(context).welcome,
            style: TextStyle(
              color: Colors.white,
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Text(
            "TecZone",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: "fontLogo",
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }
}
