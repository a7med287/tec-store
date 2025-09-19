import 'package:flutter/material.dart';
import 'package:tec_store/features/home/presentation/views/home_view.dart';
import 'package:tec_store/core/widgets/custom_bottom_nav_bar.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  static const String routName = "/main";

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeView(),
    Center(
      child: Text("Categories Page"),
    ), // Replace with actual CategoriesView()
    Center(child: Text("Search Page")), // Replace with actual SearchView()
    Center(child: Text("Cart Page")), // Replace with actual CartView()
    Center(child: Text("Profile Page")), // Replace with actual ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
