import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_notes_app/core/extensions/localization_on_build_context.dart';
import 'package:simple_notes_app/core/extensions/snackbar_on_build_context.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/add_note/add_note_cubit.dart';
import 'package:simple_notes_app/features/notes/presentation/widgets/add_note/add_note_button.dart';
import 'package:simple_notes_app/features/notes/presentation/widgets/common/note_text_field_section.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(context.localizations.addNoteScreenAppBarText),
        actions: const [
          AddNoteButton(),
        ],
      ),
      body: BlocPresentationListener<AddNoteCubit, AddNoteCubitEvent>(
        listener: _onAddNoteCubitEvent,
        child: const _AddNoteBody(),
      ),
    );
  }

  void _onAddNoteCubitEvent(BuildContext context, AddNoteCubitEvent event) {
    switch (event) {
      case NoteEmpty():
        context.showErrorSnackbar(context.localizations.addNoteScreenNoteEmptySnackbarText);
      case ErrorAddingNote():
        context.showErrorSnackbar(context.localizations.addNoteScreenCouldntAddNote);
      case AddNoteSuccess():
        context.pop<bool>(true);
    }
  }
}

class _AddNoteBody extends StatelessWidget {
  const _AddNoteBody();

  @override
  Widget build(BuildContext context) {
    return NoteTextFieldSection(
      onChanged: context.read<AddNoteCubit>().onNoteContentChanged,
    );
  }
}
