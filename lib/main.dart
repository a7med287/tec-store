import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tec_store/core/helpers/on_generate_routs.dart';
import 'package:tec_store/core/services/get_it_service.dart';
import 'package:tec_store/features/auth/presentation/views/sign_in_view.dart';
import 'core/services/shared_prefrences_singletone.dart';
import 'core/utils/app_colors.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  setupGetIt();
  runApp(const TecZone());
}

class TecZone extends StatelessWidget {
  const TecZone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,

      // switch between ar => (Arabic language) Or en => (English)
      locale: Locale("en"),

      theme: ThemeData(
        fontFamily: "Cairo",
        primaryColor: AppColors.primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: SignInView.routName,
    );
  }
}
