import 'package:flutter/material.dart';

void buildSnackBar(BuildContext context, String message,
    {bool isError = false }) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating, // يخليها تطلع عائمة
      margin: const EdgeInsets.all(12), // مسافة من الحواف
      duration: const Duration(seconds: 3), // وقت العرض
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // زوايا دائرية
      ),
      backgroundColor: isError ? Colors.redAccent : Colors.green,
      content: Row(
        children: [
          Icon(
            isError ? Icons.error_outline : Icons.check_circle_outline,
            color: Colors.white,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
      action: SnackBarAction(
        label: "إغلاق",
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}
