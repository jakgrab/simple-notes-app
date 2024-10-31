import 'package:flutter/material.dart';
import 'package:simple_notes_app/config/localization/localization_config.dart';
import 'package:simple_notes_app/config/routing/router.dart';
import 'package:simple_notes_app/config/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Simple Notes App',
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: appTheme,
    );
  }
}
