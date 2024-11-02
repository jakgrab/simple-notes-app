import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_notes_app/core/constants/colors.dart';
import 'package:simple_notes_app/core/enums/data_status/data_status.dart';
import 'package:simple_notes_app/core/extensions/localization_on_build_context.dart';
import 'package:simple_notes_app/core/extensions/snackbar_on_build_context.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/update_note/update_note_cubit.dart';
import 'package:simple_notes_app/features/notes/presentation/widgets/update_note/update_note_button.dart';
import 'package:simple_notes_app/features/notes/presentation/widgets/update_note/update_note_text_field_section.dart';

class UpdateNoteView extends StatelessWidget {
  const UpdateNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(context.localizations.updateNoteScreenAppBarText),
        actions: const [
          UpdateNoteButton(),
        ],
      ),
      body: BlocPresentationListener<UpdateNoteCubit, UpdateNoteCubitEvent>(
        listener: _onUpdateNoteCubitEvent,
        child: const _UpdateNoteViewBody(),
      ),
    );
  }

  void _onUpdateNoteCubitEvent(BuildContext context, UpdateNoteCubitEvent event) {
    switch (event) {
      case NoNoteFound():
        context.showErrorSnackbar(context.localizations.updateNoteScreenNoteNotFoundSnackbarText);
      case NoteEmpty():
        context.showErrorSnackbar(context.localizations.addNoteScreenNoteEmptySnackbarText);
      case ErrorUpdatingNote():
        context.showErrorSnackbar(context.localizations.updateNoteScreenCouldntUpdateNote);
      case UpdateNoteSuccess():
        context.pop<bool>(true);
    }
  }
}

class _UpdateNoteViewBody extends StatelessWidget {
  const _UpdateNoteViewBody();

  @override
  Widget build(BuildContext context) {
    final dataStatus = context.select((UpdateNoteCubit cubit) => cubit.state.status);

    return switch (dataStatus) {
      DataStatus.loading || DataStatus.error || DataStatus.initial => const Center(
          child: CircularProgressIndicator(
            color: AppColors.brown,
          ),
        ),
      DataStatus.success => const UpdateNoteTextFieldSection()
    };
  }
}
