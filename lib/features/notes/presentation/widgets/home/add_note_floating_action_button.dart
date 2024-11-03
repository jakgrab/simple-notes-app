import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_notes_app/core/constants/route_names.dart';
import 'package:simple_notes_app/core/extensions/localization_on_build_context.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/home/home_cubit.dart';

class AddNoteFloatingActionButton extends StatelessWidget {
  const AddNoteFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () async {
        final didAddNote = await context.pushNamed<bool>(RouteNames.addNote);

        if (didAddNote == true && context.mounted) {
          await context.read<HomeCubit>().getNotes();
        }
      },
      label: Text(context.localizations.homeScreenFABText),
      icon: const Icon(Icons.add),
    );
  }
}
