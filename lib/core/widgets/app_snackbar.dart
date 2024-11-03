import 'package:flutter/material.dart';
import 'package:simple_notes_app/core/constants/colors.dart';
import 'package:simple_notes_app/core/constants/dimentions.dart';

class AppSnackbar extends StatelessWidget {
  const AppSnackbar({
    super.key,
    required this.message,
    this.isError = false,
  });

  final String message;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isError)
          const Padding(
            padding: EdgeInsets.only(right: Dimentions.paddingSmall),
            child: Icon(
              Icons.close,
              color: AppColors.red,
            ),
          ),
        Text(message),
      ],
    );
  }
}
