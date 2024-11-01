import 'package:flutter/material.dart';

extension TextThemeOnBuildContext on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
