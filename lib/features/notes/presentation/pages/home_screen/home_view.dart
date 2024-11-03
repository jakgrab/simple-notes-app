import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_notes_app/core/enums/data_status/data_status.dart';
import 'package:simple_notes_app/core/extensions/localization_on_build_context.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/home/home_cubit.dart';
import 'package:simple_notes_app/features/notes/presentation/widgets/home/add_note_floating_action_button.dart';
import 'package:simple_notes_app/features/notes/presentation/widgets/home/notes_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(context.localizations.homeScreenAppBarText),
      ),
      floatingActionButton: const AddNoteFloatingActionButton(),
      body: const _HomeViewBody(),
    );
  }
}

class _HomeViewBody extends StatelessWidget {
  const _HomeViewBody();

  @override
  Widget build(BuildContext context) {
    final dataStatus = context.select((HomeCubit cubit) => cubit.state.status);
    return switch (dataStatus) {
      DataStatus.loading || DataStatus.error || DataStatus.initial => const LinearProgressIndicator(),
      DataStatus.success => const NotesList(),
    };
  }
}
