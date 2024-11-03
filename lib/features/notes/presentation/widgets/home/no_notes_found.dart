import 'package:flutter/material.dart';
import 'package:simple_notes_app/core/constants/colors.dart';
import 'package:simple_notes_app/core/extensions/localization_on_build_context.dart';
import 'package:simple_notes_app/core/extensions/text_theme_on_build_context.dart';

class NoNotesFound extends StatelessWidget {
  const NoNotesFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.search,
            size: 70,
            color: AppColors.brown,
          ),
          const SizedBox(height: 16),
          Text(
            context.localizations.homeScreenNoNotesFound,
            style: context.textTheme.headlineMedium?.copyWith(color: AppColors.brown),
          ),
        ],
      ),
    );
  }
}
