import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/add_note/add_note_cubit.dart';

class SaveNoteButton extends StatelessWidget {
  const SaveNoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final canSave = context.select((AddNoteCubit cubit) => cubit.state.noteContent.isNotEmpty);

    return IconButton(
      onPressed: canSave
          ? () async {
              await context.read<AddNoteCubit>().addNewNote();
            }
          : null,
      icon: Icon(
        Icons.save,
        color: canSave ? Colors.white : Colors.grey,
      ),
    );
  }
}
