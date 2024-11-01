import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/home/home_cubit.dart';
import 'package:simple_notes_app/features/notes/presentation/widgets/home/no_notes_found.dart';
import 'package:simple_notes_app/features/notes/presentation/widgets/home/note_item.dart';

class NotesList extends StatelessWidget {
  const NotesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final notes = context.select((HomeCubit cubit) => cubit.state.notes);

    return notes.isEmpty
        ? const NoNotesFound()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomScrollView(
              slivers: [
                SliverList.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: NoteItem(note: notes[index]),
                      );
                    }

                    if (index == notes.length - 1) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: NoteItem(note: notes[index]),
                      );
                    }

                    return NoteItem(note: notes[index]);
                  },
                ),
              ],
            ),
          );
  }
}
