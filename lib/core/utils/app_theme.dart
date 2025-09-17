import 'package:flutter/material.dart';

class AppTheme {
  /// 🎨 الألوان
  static const Color primary = Color(
    0xFF03447D,
  ); // ✋ اللون الأساسي (الأزرق الغامق) - Buttons, AppBar
  static const Color secondary = Color(
    0xFF0397D9,
  ); // ✋ اللون الثانوي (الأزرق الفاتح) - Highlights, Accent
  static const Color background = Colors.white; // ✋ لون خلفية الشاشة (Scaffold)
  static const Color surface =
      Colors.white; // ✋ لون خلفية الـ Cards, Containers
  static const Color error =
      Colors.red; // ✋ لون الأخطاء (مثلاً Validation Error)

  static const Color textPrimary = Color(
    0xFF333333,
  ); // ✋ النصوص الرئيسية (Body Text, Titles)
  static const Color textOnPrimary =
      Colors.white; // ✋ النصوص اللي فوق الـ Primary (مثلاً Text في Button أزرق)
  static const Color textOnSecondary =
      Colors.white; // ✋ النصوص اللي فوق الـ Secondary
  static const Color textOnError = Colors.white; // ✋ النصوص اللي فوق الـ Error

  /// 🔤 النصوص
  static const TextStyle heading1 = TextStyle(
    // ✋ أكبر عنوان (مثلاً Screen Title)
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle heading2 = TextStyle(
    // ✋ عنوان فرعي (Subheading)
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle body = TextStyle(
    // ✋ النصوص العادية (Paragraphs, Descriptions)
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle button = TextStyle(
    // ✋ النصوص اللي جوه الأزرار
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  /// 🌞 Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light, // ✋ يحدد إن ده Light Mode
    colorScheme: const ColorScheme(
      brightness: Brightness.light, // ✋ Light Color Scheme
      primary: primary, // ✋ اللون الأساسي
      onPrimary: textOnPrimary, // ✋ النصوص فوق اللون الأساسي
      secondary: secondary, // ✋ اللون الثانوي
      onSecondary: textOnSecondary, // ✋ النصوص فوق اللون الثانوي
      error: error, // ✋ لون الخطأ
      onError: textOnError, // ✋ النصوص فوق لون الخطأ
      surface: surface, // ✋ سطح الـ Cards, Sheets
      onSurface: textPrimary, // ✋ النصوص فوق الـ Surface
    ),
    textTheme: const TextTheme(
      displayLarge: heading1, // ✋ مابنج Heading1 على displayLarge
      displayMedium: heading2, // ✋ مابنج Heading2 على displayMedium
      bodyLarge: body, // ✋ النصوص العادية
      labelLarge: button, // ✋ النصوص الخاصة بالأزرار
    ),
  );

  /// 🌙 Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark, // ✋ يحدد إن ده Dark Mode
    colorScheme: const ColorScheme(
      brightness: Brightness.dark, // ✋ Dark Color Scheme
      primary: Colors.white, // ✋ اللون الأساسي في الـ Dark (هنا أبيض)
      onPrimary: Colors.black, // ✋ النصوص فوق الأبيض
      secondary: secondary, // ✋ اللون الثانوي (ثابت)
      onSecondary: Colors.black, // ✋ النصوص فوق اللون الثانوي
      error: error, // ✋ لون الخطأ
      onError: textOnError, // ✋ النصوص فوق الخطأ
      surface: Color(0xFF121212), // ✋ الخلفية الداكنة للـ Cards
      onSurface: Colors.white, // ✋ النصوص فوق الخلفية الداكنة
    ),
    textTheme: const TextTheme(
      displayLarge: heading1, // ✋ Heading1 في الوضع الداكن
      displayMedium: heading2, // ✋ Heading2 في الوضع الداكن
      bodyLarge: body, // ✋ Body Text في الوضع الداكن
      labelLarge: button, // ✋ Text Button في الوضع الداكن
    ),
  );
}
