import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/home/home_cubit.dart';
import 'package:simple_notes_app/features/notes/presentation/widgets/home/no_notes_found.dart';
import 'package:simple_notes_app/features/notes/presentation/widgets/home/notes_list_content.dart';

class NotesList extends StatelessWidget {
  const NotesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final notes = context.select((HomeCubit cubit) => cubit.state.notes);

    return notes.isEmpty
        ? const NoNotesFound() //
        : NotesListContent(notes: notes);
  }
}
