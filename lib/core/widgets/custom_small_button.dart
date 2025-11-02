import 'package:flutter/material.dart';
import 'package:tec_store/core/utils/app_theme.dart';

class CustomSmallButton extends StatelessWidget {
  const CustomSmallButton({
    super.key,
    required this.onTap,
    required this.text,
    this.backColor = AppTheme.secondary,
  });

  final VoidCallback onTap;
  final String text;
  final Color backColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(text, style: TextStyle(fontSize: 15, color: Colors.white)),
    );
  }
}
