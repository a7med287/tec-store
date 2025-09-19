import 'package:flutter/material.dart';
import 'package:tec_store/features/home/presentation/views/widgets/categories_section.dart';
import 'package:tec_store/features/home/presentation/views/widgets/featured_products_section.dart';
import 'package:tec_store/features/home/presentation/views/widgets/header_section.dart';
import 'package:tec_store/features/home/presentation/views/widgets/recommended_section.dart';
import 'package:tec_store/features/home/presentation/views/widgets/search_bar_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routName = "HomeView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20).copyWith(top: 32),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                HeaderSection(),
                SizedBox(height: 24),
                SearchBarSection(),
                SizedBox(height: 24),
                FeaturedProductsSection(),
                SizedBox(height: 24),
                CategoriesSection(),
                SizedBox(height: 24),
                RecommendedSection(),
              ],
            ),
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
