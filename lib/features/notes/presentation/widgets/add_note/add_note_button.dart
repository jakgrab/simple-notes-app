import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/add_note/add_note_cubit.dart';
import 'package:simple_notes_app/features/notes/presentation/widgets/common/save_note_button.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final canSave = context.select((AddNoteCubit cubit) => cubit.state.noteContent.isNotEmpty);
    final dataStatus = context.select((AddNoteCubit cubit) => cubit.state.status);

    return SaveNoteButton(
      canSave: canSave,
      dataStatus: dataStatus,
      onSave: () async {
        await context.read<AddNoteCubit>().addNewNote();
      },
    );
  }
}
