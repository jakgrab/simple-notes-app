import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/update_note/update_note_cubit.dart';
import 'package:simple_notes_app/features/notes/presentation/widgets/common/save_note_button.dart';

class UpdateNoteButton extends StatelessWidget {
  const UpdateNoteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final canSave = context.select((UpdateNoteCubit cubit) => cubit.state.noteContent.isNotEmpty);
    final dataStatus = context.select((UpdateNoteCubit cubit) => cubit.state.status);

    return SaveNoteButton(
      canSave: canSave,
      dataStatus: dataStatus,
      onSave: () async {
        await context.read<UpdateNoteCubit>().updateNote();
      },
    );
  }
}
