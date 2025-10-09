import 'package:flutter/material.dart';

import 'back_icon_widget.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BackIconWidget(),
        Spacer(),
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Spacer(flex: 2),
      ],
    );
  }
}
