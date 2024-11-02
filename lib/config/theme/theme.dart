import 'package:flutter/material.dart';
import 'package:simple_notes_app/config/theme/notes_typography.dart';
import 'package:simple_notes_app/core/constants/colors.dart';

final appTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: AppColors.white,
  appBarTheme: const AppBarTheme(
    foregroundColor: AppColors.white,
    backgroundColor: AppColors.brown,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: AppColors.white,
    backgroundColor: AppColors.brown,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: AppColors.lightBrown),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: AppColors.lightBrown),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: AppColors.lightBrown),
    ),
  ),
  textTheme: NotesTypography.textTheme,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.lightBrown,
    selectionColor: AppColors.lightBrown,
    selectionHandleColor: AppColors.lightBrown,
  ),
);
