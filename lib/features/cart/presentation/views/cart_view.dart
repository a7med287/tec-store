import 'package:flutter/material.dart';
import 'package:tec_store/core/widgets/button_navigation_bar.dart';
import 'package:tec_store/features/cart/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  static const String routeName = "CartView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CartViewBody()),
      bottomNavigationBar: ButtonNavigationBar(selectedIndex: 1),
    );
  }
}
