import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_notes_app/config/di/locator.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/update_note/update_note_cubit.dart';
import 'package:simple_notes_app/features/notes/presentation/pages/update_note_screen/update_note_view.dart';

class UpdateNoteScreen extends StatelessWidget {
  const UpdateNoteScreen({super.key, this.noteId});

  final String? noteId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<UpdateNoteCubit>()..init(noteId),
      child: const UpdateNoteView(),
    );
  }
}
