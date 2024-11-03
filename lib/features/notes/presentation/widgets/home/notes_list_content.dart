import 'package:flutter/material.dart';
import 'package:simple_notes_app/features/notes/domain/entities/note.dart';
import 'package:simple_notes_app/features/notes/presentation/widgets/home/note_item.dart';

class NotesListContent extends StatelessWidget {
  const NotesListContent({super.key, required this.notes});

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
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
                  padding: const EdgeInsets.only(top: 16),
                  child: NoteItem(note: notes[index]),
                );
              }

              if (index == notes.length - 1) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
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
