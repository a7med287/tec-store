import 'package:flutter/material.dart';
import 'package:tec_store/features/home/presentation/views/widgets/categories_section.dart';
import 'package:tec_store/features/home/presentation/views/widgets/featured_products_section.dart';
import 'package:tec_store/features/home/presentation/views/widgets/header_section.dart';
import 'package:tec_store/features/home/presentation/views/widgets/recommended_section.dart';
import 'package:tec_store/features/home/presentation/views/widgets/search_bar_section.dart';

import '../../../../core/utils/app_theme.dart';
import '../../../../generated/l10n.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const String routName = "HomeView";
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20).copyWith(top: 32),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children:  [
              HeaderSection(),
              SizedBox(height: 24),
              SearchBarSection(),
              SizedBox(height: 24),
              FeaturedProductsSection(),
              SizedBox(height: 24),
              CategoriesSection(),
              SizedBox(height: 24),
              Text(
                 S.of(context).recommendedForYou,
                 style: AppTheme.heading2.copyWith(color: AppTheme.textPrimary),
              ),
              RecommendedSection(),
            ],
          ),
        ),
      ),
      floatingActionButton: GradientFAB(
        onPressed: () {
          // إضافة وظيفة عند الضغط على الزر
        },
      ),
    );
  }
}

class GradientFAB extends StatelessWidget {
  final VoidCallback onPressed;

  const GradientFAB({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      onPressed: () {},
      backgroundColor: Colors.transparent,
      elevation: 2,
      child: Ink(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF03447D), Color(0xFF0397D9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.smart_toy_outlined, color: Colors.white),
      ),
    );
  }
}
