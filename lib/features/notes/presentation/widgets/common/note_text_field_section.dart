import 'package:flutter/material.dart';
import 'package:simple_notes_app/core/constants/dimentions.dart';
import 'package:simple_notes_app/core/widgets/app_text_field.dart';

class NoteTextFieldSection extends StatelessWidget {
  const NoteTextFieldSection({super.key, this.initialText, this.onChanged});

  final String? initialText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: Dimentions.spacingMedium,
          ),
          Padding(
            padding: const EdgeInsets.all(Dimentions.paddingSmall),
            child: AppTextField(
              initialText: initialText,
              onChanged: onChanged,
            ),
          ),
          const SizedBox(
            height: Dimentions.spacingExtraLarge,
          ),
        ],
      ),
    );
  }
}
