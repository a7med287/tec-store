import 'package:flutter/material.dart';
import 'package:tec_store/core/utils/app_theme.dart';
import 'package:tec_store/features/cart/presentation/views/cart_view.dart';
import 'package:tec_store/features/home/presentation/views/home_view.dart';

class ButtonNavigationBar extends StatelessWidget {
  final int selectedIndex;
  const ButtonNavigationBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppTheme.primary,
      unselectedItemColor: Colors.grey,
      currentIndex: selectedIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, HomeView.routName);
            break;
          case 1:
            Navigator.pushNamed(context, CartView.routeName);
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: "Cart",
        ),
      ],
    );
  }
}
