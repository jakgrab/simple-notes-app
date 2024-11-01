import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_notes_app/core/constants/route_names.dart';
import 'package:simple_notes_app/core/enums/data_status/data_status.dart';
import 'package:simple_notes_app/core/extensions/localization_on_build_context.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/home/home_cubit.dart';
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final didAddNote = await context.pushNamed<bool>(RouteNames.addNote);

          if (didAddNote == true && context.mounted) {
            await context.read<HomeCubit>().getNotes();
          }
        },
        label: Text(context.localizations.homeScreenFABText),
        icon: const Icon(Icons.add),
      ),
      body: const HomeViewBody(),
    );
  }
}

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final dataStatus = context.select((HomeCubit cubit) => cubit.state.status);
    return switch (dataStatus) {
      DataStatus.loading || DataStatus.error || DataStatus.initial => const LinearProgressIndicator(),
      DataStatus.success => const NotesList(),
    };
  }
}
