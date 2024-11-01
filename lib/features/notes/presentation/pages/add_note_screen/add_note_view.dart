import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_notes_app/core/extensions/localization_on_build_context.dart';
import 'package:simple_notes_app/core/extensions/snackbar_on_build_context.dart';
import 'package:simple_notes_app/core/widgets/app_text_field.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/add_note/add_note_cubit.dart';
import 'package:simple_notes_app/features/notes/presentation/widgets/add_note/save_note_button.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(context.localizations.addNoteScreenAppBarText),
        actions: const [
          SaveNoteButton(),
        ],
      ),
      body: BlocPresentationListener<AddNoteCubit, AddNoteCubitEvent>(
        listener: _onAddNoteCubitEvent,
        child: const AddNoteViewBody(),
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

class AddNoteViewBody extends StatelessWidget {
  const AddNoteViewBody({super.key});

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
              onChanged: context.read<AddNoteCubit>().onNoteContentChanged,
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
