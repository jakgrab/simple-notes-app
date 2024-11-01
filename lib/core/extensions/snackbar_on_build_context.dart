import 'package:flutter/material.dart';
import 'package:simple_notes_app/core/constants/colors.dart';
import 'package:simple_notes_app/core/widgets/app_snackbar.dart';

extension SnackbarOnContext on BuildContext {
  void showSuccessSnackbar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.brown,
        behavior: SnackBarBehavior.floating,
        content: AppSnackbar(
          message: message,
        ),
      ),
    );
  }

  void showErrorSnackbar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.brown,
        behavior: SnackBarBehavior.floating,
        content: AppSnackbar(
          isError: true,
          message: message,
        ),
      ),
    );
  }
}
