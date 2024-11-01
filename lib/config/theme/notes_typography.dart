import 'package:flutter/material.dart';

abstract class NotesTypography {
  static const textTheme = TextTheme(
    labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    bodySmall: TextStyle(fontSize: 12),
    bodyLarge: TextStyle(fontSize: 16),
    headlineMedium: TextStyle(fontSize: 25),
  );
}
