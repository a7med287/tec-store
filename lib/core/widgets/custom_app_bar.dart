import 'package:flutter/material.dart';

import 'back_icon_widget.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BackIconWidget(),
        Spacer(),
        Text(
          "Laptop Details",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Spacer(flex: 2),
      ],
    );
  }
}
