import 'package:flutter/material.dart';

class AppText {
  static TextTheme generateTextTheme() {
    return const TextTheme(
      bodySmall: TextStyle(color: Colors.white70, fontSize: 14),
      bodyMedium: TextStyle(color: Colors.white, fontSize: 16),
      bodyLarge: TextStyle(color: Colors.white, fontSize: 18),
    );
  }
}
