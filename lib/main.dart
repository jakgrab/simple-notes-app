import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_notes_app/app.dart';
import 'package:simple_notes_app/config/database/hive_config.dart';
import 'package:simple_notes_app/config/di/locator.dart';
import 'package:simple_notes_app/core/constants/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveDatabase();

  setupDependencies();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.brown,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  );

  runApp(const App());
}
