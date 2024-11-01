import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_notes_app/core/constants/colors.dart';
import 'package:simple_notes_app/core/enums/data_status/data_status.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/add_note/add_note_cubit.dart';

class SaveNoteButton extends StatelessWidget {
  const SaveNoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final canSave = context.select((AddNoteCubit cubit) => cubit.state.noteContent.isNotEmpty);
    final dataStatus = context.select((AddNoteCubit cubit) => cubit.state.status);

    return IconButton(
      onPressed: canSave
          ? () async {
              await context.read<AddNoteCubit>().addNewNote();
            }
          : null,
      icon: switch (dataStatus) {
        DataStatus.loading => const _LoadingIcon(),
        _ => Icon(
            Icons.save,
            color: canSave ? Colors.white : Colors.grey,
          ),
      },
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 16,
      width: 16,
      child: CircularProgressIndicator(
        color: AppColors.white,
        strokeWidth: 2,
      ),
    );
  }
}
