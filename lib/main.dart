import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_notes_app/app.dart';
import 'package:simple_notes_app/config/database/hive_config.dart';
import 'package:simple_notes_app/config/di/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupDependencies();
  await initHiveDatabase();

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
