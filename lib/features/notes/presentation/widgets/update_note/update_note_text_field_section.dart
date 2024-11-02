import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/update_note/update_note_cubit.dart';
import 'package:simple_notes_app/features/notes/presentation/widgets/common/note_text_field_section.dart';

class UpdateNoteTextFieldSection extends StatelessWidget {
  const UpdateNoteTextFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    final initialText = context.select((UpdateNoteCubit cubit) => cubit.state.note?.content);

    return NoteTextFieldSection(
      initialText: initialText,
      onChanged: context.read<UpdateNoteCubit>().onNoteContentChanged,
    );
  }
}
