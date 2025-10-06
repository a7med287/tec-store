import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tec_store/core/helpers/on_generate_routs.dart';
import 'package:tec_store/core/services/get_it_service.dart';
import 'package:tec_store/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:tec_store/features/home/domain/repos/home_epo.dart';
import 'package:tec_store/features/home/presentation/cubits/laptops_cubit/laptops_cubit.dart';
import 'package:tec_store/features/home/presentation/views/home_view.dart';
import 'core/services/shared_prefrences_singletone.dart';
import 'core/utils/app_theme.dart';
import 'features/auth/domain/repos/auth_epo.dart';
import 'features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'features/auth/presentation/cubits/verify_email_cubit/verify_email_cubit.dart';
import 'features/home/presentation/cubits/recommended_laptops/recommended_laptops_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => RegisterCubit(getIt<AuthRepo>())),
        BlocProvider(create: (_) => VerifyEmailCubit(getIt<AuthRepo>())),
        BlocProvider(create: (_) => ResetPasswordCubit(getIt<AuthRepo>())),
        BlocProvider(create: (_) => LaptopsCubit(getIt<HomeRepo>())),
        BlocProvider(create: (_) => RecommendedLaptopsCubit(getIt<HomeRepo>())),
      ],
      child: MaterialApp(
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
          primaryColor: AppTheme.primary,
          colorScheme: ColorScheme.fromSeed(seedColor: AppTheme.primary),
        ),
        onGenerateRoute: onGenerateRoute,
        initialRoute: HomeView.routName,
      ),
    );
  }
}
