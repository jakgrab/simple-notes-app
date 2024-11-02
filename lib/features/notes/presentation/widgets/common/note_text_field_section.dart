import 'package:flutter/material.dart';
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
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppTextField(
              initialText: initialText,
              onChanged: onChanged,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
