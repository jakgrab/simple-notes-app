import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_notes_app/app.dart';
import 'package:simple_notes_app/config/di/locator.dart';

void main() {
  setupDependencies();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.brown,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  );

  runApp(const App());
}
