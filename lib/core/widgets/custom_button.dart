import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.text, this.color = AppTheme.primary});
  final void Function()? onTap;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
