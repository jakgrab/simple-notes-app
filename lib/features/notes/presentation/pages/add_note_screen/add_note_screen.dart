import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_notes_app/config/di/locator.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/add_note/add_note_cubit.dart';
import 'package:simple_notes_app/features/notes/presentation/pages/add_note_screen/add_note_view.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<AddNoteCubit>(),
      child: const AddNoteView(),
    );
  }
}
