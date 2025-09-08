import 'package:flutter/material.dart';
import 'package:tec_store/core/utils/app_images.dart';
import 'package:tec_store/generated/l10n.dart';

import '../../../auth/presentation/views/sign_in_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, SignInView.routName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.whiteLogo, height: 180),
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
