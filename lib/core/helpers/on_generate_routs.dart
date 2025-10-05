import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tec_store/features/auth/presentation/views/forget_password_view.dart';
import 'package:tec_store/features/auth/presentation/views/register_view.dart';
import 'package:tec_store/features/auth/presentation/views/verfiy_view.dart';
import 'package:tec_store/features/home/presentation/cubits/laptops_cubit/laptops_cubit.dart';
import 'package:tec_store/features/home/presentation/views/laptops_grid_view.dart';
import 'package:tec_store/features/home/presentation/views/product_details_view.dart';
import 'package:tec_store/features/home/presentation/views/widgets/main_layout.dart';
import 'package:tec_store/features/home/presentation/views/home_view.dart';
import 'package:tec_store/features/splash/presetation/views/splash_view.dart';
import '../../features/auth/presentation/views/create_new_password_view.dart';
import '../../features/auth/presentation/views/sign_in_view.dart';
import '../enums/verify_flow.dart';

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
    case CreateNewPasswordView.routName:
      final args = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder:
            (context) =>
                CreateNewPasswordView(email: args['email'], code: args['code']),
      );
    case VerifyView.routName:
      final args = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder:
            (context) => VerifyView(
              email: args['email'],
              flow: args['flow'] as VerifyFlow,
            ),
      );
    case HomeView.routName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case MainLayout.routName:
      return MaterialPageRoute(builder: (context) => const MainLayout());
    case ProductDetailsView.routName:
      return MaterialPageRoute(
        builder: (context) => const ProductDetailsView(),
      );
    case LaptopsGridView.routName:
      return MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: context.read<LaptopsCubit>(),
          child: const LaptopsGridView(),
        ),
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
